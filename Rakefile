# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

begin
  require 'rspec'
  require 'rspec/core/rake_task'
  Rspec::Core::RakeTask.new :rspec
rescue
end

Woldumar::Application.load_tasks

def find_or_create(klass, id_field, value, attributes)
  item = klass.send "find_by_#{id_field}", value
  if item.nil?
    item = klass.create! attributes.merge(id_field => value)
  end
  item
end

namespace :db do
  task :seed do
    find_or_create(User, :email, 'dan.poggi@gmail.com', :password => 'secret', :password_confirmation => 'secret', :first_name => 'Dan', :last_name => 'Poggi')
    find_or_create(User, :email, 'jimmy.perrine@gmail.com', :password => 'secret', :password_confirmation => 'secret', :first_name => 'Jimmy', :last_name => 'Perrine')
    find_or_create(User, :email, 'brad.handy@gmail.com', :password => 'secret', :password_confirmation => 'secret', :first_name => 'Brad', :last_name => 'Handy')
    find_or_create(User, :email, 'jimbeil@yahoo.com', :password => 'secret', :password_confirmation => 'secret', :first_name => 'Jim', :last_name => 'Beil')
  end
end
