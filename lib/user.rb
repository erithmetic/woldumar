require 'digest/sha1'

User.class_eval do
  cattr_reader :per_page
  @@per_page = 10

  has_many :event_registrations

#  validates_presence_of :first_name, :last_name
  has_many :session_registrations
  has_many :donations  # hopefully!
  has_many :orders
  
  accepts_nested_attributes_for :session_registrations

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.search(search, page)
    paginate :per_page => 5, :page => page,
             :conditions => ['first_name like ? or last_name like ?', "%#{search}%", "%#{search}%"], :order => 'last_name'
  end

  def self.generate_password(email)
    Digest::SHA1.hexdigest email
  end

  def admin?
    has_role?('Refinery')
  end
                              
  def is_member?
    is_member
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def username
    email
  end

  def save(*args)
    self.username = email
    super
  end
end
