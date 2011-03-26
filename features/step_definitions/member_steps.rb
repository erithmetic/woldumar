Given /a member with email "(.*)" and password "(.*)" exists/ do |email, password|
  User.create :email => email, :password => password, :password_confirmation => password
end
