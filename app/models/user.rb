require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :event_registrations

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name
  has_many :session_registrations
  
  accepts_nested_attributes_for :session_registrations

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  
  # These fields are protected from mass assignment.  You cannot call User.new(...) with these attributes.  You must
  # set them singly.
  attr_protected :is_admin, :is_member

  # Association with orders
  has_many :orders

  def self.generate_password(email)
    Digest::SHA1.hexdigest email
  end

  def is_admin?
    is_admin
  end
                              
  def is_member?
    is_member
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
