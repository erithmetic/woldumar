class SessionRegistration < ActiveRecord::Base
  belongs_to :user
  has_many :children, :dependent => :destroy
  
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
end
