require 'transaction'

class Donation < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :amount
  validates_numericality_of :amount, :greater_than => 0.0
  validates_presence_of :user
  validates_associated :user

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
