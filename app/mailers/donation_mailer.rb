class DonationMailer < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.donation.receipt.subject
  #
  def receipt(donation)
    mail :to => donation.email
  end
end
