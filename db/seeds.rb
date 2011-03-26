admins = {
  'dan.poggi@gmail.com' => ['Dan', 'Poggi'],
  'jimmy.perrine@gmail.com' => ['Jimmy', 'Perrine'],
  'brad.handy@gmail.com' => ['Brad', 'Handy'],
  'jimbeil@yahoo.com' => ['Jim', 'Beil']
}

admins.each do |email_frozen, name|
  email = email_frozen.dup
  fname = name.first.dup
  lname = name.last.dup

  print "Creating admin #{email}... "
  if User.create(:email => email,
                 :password => 'secret',
                 :password_confirmation => 'secret',
                 :first_name => lname,
                 :last_name => fname,
                 :is_admin => true)
    print "success!\n"
  else
    print "fail :*(\n"
  end
end

print "Initializing Authorize.Net credentials... "
if AuthorizeNetCredential.create :username => 'authorizenetuser', :password => '123456789'
  print "done!\n"
else
  print "fail!\n"
end
