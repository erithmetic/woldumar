Given /a member with email "(.*)" and password "(.*)" exists/ do |email, password, privileges|
  User.create :email => email, :password => password, :password_confirmation => password
end

Given /I am logged in as "([^"]*)" with email "([^"]*)"(?: having (admin|member|all) privileges)?/ do |name, email, privileges|
  @privileges = (privileges.nil?) ? "" : privileges.downcase
  @admin, @member = (@privileges == "both" || privileges.nil?) ?
          [!privileges.nil?, !privileges.nil?] : [@privileges == "admin", @privileges == "member"]
  @name_parts = name.split(/\s+/)

  @user = User.new(:first_name => @name_parts[0], :last_name => @name_parts[1], :email => email, :password => "password",
           :password_confirmation => "password")
  @user.is_admin = @admin
  @user.is_member = @member
  @user.save!

  And %{I go to the admin page}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "password"}
  And %{I press "Sign in"}

end

When /there exists a user "([^"]*)" with email "([^"]*)"$/ do |name, email|
  @name_parts = name.split(/\s+/)

  User.new(:first_name => @name_parts[0], :last_name => @name_parts[1], :email => email, :password => "testtest",
           :password_confirmation => "testtest").save!
end

When /(?:|I )?want to change the "([^"]*)" for "([^"]*)" to "([^"]*)"$/ do |field, email, new_value|
  @user = User.find_by_email(email)
  @field = field.split(/\s+/).unshift("user").join("_")

  And %{I follow "edit#{@user.id}"}
  And %{I fill in "#{@field}" with "#{new_value}"}
end

Then /the field "([^"]*)" for user "([^"]*)" should have a value of "([^"]*)"/ do |field, email, new_value|
  @user = User.find_by_email(email)
  @field = field.split(/\s+/).join("_").to_sym()

  assert @user.send(@field) == new_value
end