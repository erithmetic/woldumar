class Transaction
  attr_accessor :first_name, :last_name, :cc_number, :cc_expiration_month,
    :cc_expiration_year, :cc_ccv, :message, :amount

  def initialize(params)
    params.each do |name, value|
      next if value.is_a? Hash
      self.send "#{name}=", value
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :number     => cc_number,
      :month      => cc_expiration_month,
      :year       => cc_expiration_year,
      :first_name => first_name,
      :last_name  => last_name,
      :verification_value  => cc_ccv
    )
  end

  def gateway
    @gateway ||= ActiveMerchant::Billing::AuthorizeNetGateway.new(
      :login    => ENV['GATEWAY_LOGIN'],
      :password => ENV['GATEWAY_PASSWORD'],
      :test => !Rails.env.production?
    )
  end

  def post
    if credit_card.valid?
      # Authorize for $10 dollars (1000 cents) 
      response = gateway.authorize(1000, credit_card)

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
