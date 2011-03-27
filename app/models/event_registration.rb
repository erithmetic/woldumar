require 'transaction'

class EventRegistration < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  has_many :event_tickets, :through => :event_registrations_tickets

  attr_accessor :credit_card

  def credit_card
    @credit_card ||= {}
  end

  def total
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
