class SessionRegistration < ActiveRecord::Base
  belongs_to :user
  has_many :children, :dependent => :destroy
  
  validates_presence_of :total_amount
  validates_numericality_of :total_amount, :greater_than => 0.0
  validates_presence_of :user
  validates_associated :user
  
  money_column :total_cost
  
  accepts_nested_attributes_for :children
  
  before_save :calculate_total
  
  def calculate_total
    cost = BigDecimal('0.00')
    children.each do |child|
      child.session_child_registrations.each do |scr|
        cost += scr.session.camp.fee.value
        cost -= scr.session.camp.discount.value if user.is_member?
        cost += BigDecimal("#{scr.extended_care_cost}") if scr.extended_care_cost
        cost += BigDecimal('5.00') if scr.photo
        cost -= BigDecimal('10.00') if scr.early_discount
      end
    end
    self.total_cost = "$#{cost}"
  end
  
  
  attr_accessor :credit_card

  def credit_card
    @credit_card ||= {}
  end

  def transaction
    params = credit_card
    if user
      params.merge! :first_name => user.first_name, :last_name => user.last_name
    end
    @transaction ||= Transaction.new params
  end

  def save
    result = transaction.post
    if result.present?
      self.cc_auth = result
      super
    else
      false
    end
  end
end
