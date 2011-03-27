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
                 :first_name => fname,
                 :last_name => lname,
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

print "Adding Event... "
if Events.create(:name => 'Fiber Fun',
    :description => 'Wet felting and weaving amulut pouches on cardboard',
    :created_at => '',
    :updated_at => '',
    :details => 'Saturday, April 9, 10 a.m. - 3 p.m. and Sunday, April 10, 12 noon - 4 p.m.',
    :start_date => '2011-04-09',
    :end_date => '2011-04-10',
    :flier_file_name => '',
    :flier_content_type => '',
    :flier_file_size => '',
    :flier_updated_at => '',
				)
  print "done!\n"
else
  print "fail!\n"
end

print "Adding Event... "
if Events.create(:name => 'Time Travelers',
    :description => 'Children ages 4-12 have the opportunity to get outdoors and try new things at Woldumar’s Spring Break Camp 2011.',
    :created_at => '',
    :updated_at => '',
    :details => 'Hikes highlighting useful plants and animals, a visit to the 1860s Moon Log Cabin, and pioneer games & toys will help campers discover how people in Michigan lived hundreds of years ago. '
	+ 'Camp runs from 9:00 a.m. to 4:00 p.m. daily. Camp Fees: $30/day for Woldumar members; $40/day for on-members OR $135/full week for Woldumar members; $170/full week for Non-members.',
	+ 'Extended Care is available. Before Care starts at 7:00 a.m.; campers in After Care must be picked up by 6:00 p.m. Before OR After Care: $3/day. ' 
	+ 'For more information contact Lena Swehla at lena@woldumar.org '
    :start_date => '2011-04-04',
    :end_date => '2011-04-04',
    :flier_file_name => '',
    :flier_content_type => '',
    :flier_file_size => '',
    :flier_updated_at => '',
				)
  print "done!\n"
else
  print "fail!\n"
end

print "Adding Event... "
if Events.create(:name => 'Wonderful Wetlands',
    :description => 'Children ages 4-12 have the opportunity to get outdoors and try new things at Woldumar’s Spring Break Camp 2011.',
    :created_at => '',
    :updated_at => '',
    :details => 'Campers will visit different wetland habitats in search of the small and large creatures that inhabit them. '
	+ 'Camp runs from 9:00 a.m. to 4:00 p.m. daily. Camp Fees: $30/day for Woldumar members; $40/day for on-members OR $135/full week for Woldumar members; $170/full week for Non-members.',
	+ 'Extended Care is available. Before Care starts at 7:00 a.m.; campers in After Care must be picked up by 6:00 p.m. Before OR After Care: $3/day. ' 
	+ 'For more information contact Lena Swehla at lena@woldumar.org '
    :start_date => '2011-04-05',
    :end_date => '2011-04-05',
    :flier_file_name => '',
    :flier_content_type => '',
    :flier_file_size => '',
    :flier_updated_at => '',
				)
  print "done!\n"
else
  print "fail!\n"
end

print "Adding Event... "
if Events.create(:name => 'Beasts with Backbones',
    :description => 'Children ages 4-12 have the opportunity to get outdoors and try new things at Woldumar’s Spring Break Camp 2011.',
    :created_at => '',
    :updated_at => '',
    :details => 'A visit with live animals in the nature center and searching trails for wild animals will help campers learn all about the vertebrate animal groups. '
	+ 'Camp runs from 9:00 a.m. to 4:00 p.m. daily. Camp Fees: $30/day for Woldumar members; $40/day for on-members OR $135/full week for Woldumar members; $170/full week for Non-members.',
	+ 'Extended Care is available. Before Care starts at 7:00 a.m.; campers in After Care must be picked up by 6:00 p.m. Before OR After Care: $3/day. ' 
	+ 'For more information contact Lena Swehla at lena@woldumar.org '
    :start_date => '2011-04-06',
    :end_date => '2011-04-06',
    :flier_file_name => '',
    :flier_content_type => '',
    :flier_file_size => '',
    :flier_updated_at => '',
				)
  print "done!\n"
else
  print "fail!\n"
end

print "Adding Event... "
if Events.create(:name => 'Busy Birds and Bugs',
    :description => 'Children ages 4-12 have the opportunity to get outdoors and try new things at Woldumar’s Spring Break Camp 2011.',
    :created_at => '',
    :updated_at => '',
    :details => 'Campers will search the sky, forests and prairie for birds and insects, and dig in the mud in search of creatures under our feet during this study of flying friends. '
	+ 'Camp runs from 9:00 a.m. to 4:00 p.m. daily. Camp Fees: $30/day for Woldumar members; $40/day for on-members OR $135/full week for Woldumar members; $170/full week for Non-members.',
	+ 'Extended Care is available. Before Care starts at 7:00 a.m.; campers in After Care must be picked up by 6:00 p.m. Before OR After Care: $3/day. ' 
	+ 'For more information contact Lena Swehla at lena@woldumar.org '
    :start_date => '2011-04-07',
    :end_date => '2011-04-07',
    :flier_file_name => '',
    :flier_content_type => '',
    :flier_file_size => '',
    :flier_updated_at => '',
				)
  print "done!\n"
else
  print "fail!\n"
end

print "Adding Event... "
if Events.create(:name => 'Where Are We?',
    :description => 'Children ages 4-12 have the opportunity to get outdoors and try new things at Woldumar’s Spring Break Camp 2011.',
    :created_at => '',
    :updated_at => '',
    :details => 'Campers will use compasses and GPS units, and create and follow maps to find each other and hidden treasures. '
	+ 'Camp runs from 9:00 a.m. to 4:00 p.m. daily. Camp Fees: $30/day for Woldumar members; $40/day for on-members OR $135/full week for Woldumar members; $170/full week for Non-members.',
	+ 'Extended Care is available. Before Care starts at 7:00 a.m.; campers in After Care must be picked up by 6:00 p.m. Before OR After Care: $3/day. ' 
	+ 'For more information contact Lena Swehla at lena@woldumar.org '
    :start_date => '2011-04-08',
    :end_date => '2011-04-08',
    :flier_file_name => '',
    :flier_content_type => '',
    :flier_file_size => '',
    :flier_updated_at => '',
				)
  print "done!\n"
else
  print "fail!\n"
end
