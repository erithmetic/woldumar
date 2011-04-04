class Transaction
  attr_accessor :first_name, :last_name, :number, :expiration_month,
    :expiration_year, :ccv, :message, :amount

  def initialize(params)
    params.each do |name, value|
      next if value.is_a? Hash
      self.send "#{name}=", value
    end
    self.amount ||= 0
  end

  def credentials
    @credentials ||= AuthorizeNetCredential.first
    @credentials ||= AuthorizeNetCredential.create :username => 'test', :password => 'secret'
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :number     => number,
      :month      => expiration_month,
      :year       => expiration_year,
      :first_name => first_name,
      :last_name  => last_name,
      :verification_value  => ccv
    )
  end

  def gateway
    @gateway ||= ActiveMerchant::Billing::AuthorizeNetGateway.new(
      :login    => credentials.username,
      :password => credentials.password,
      :test => !Rails.env.production?
    )
  end

  def post
    return true if number.blank?
    if credit_card.valid?
      response = gateway.authorize((amount * 100).to_i, credit_card)

      if response.success?
        # Capture the money
        gateway.capture(amount, response.authorization)
        return response.authorization
      else
        self.message = response.message 
        return false
      end
    else
      self.message = 'Your credit card information was invalid'
      return false
    end
  end
end
