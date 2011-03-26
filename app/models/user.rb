class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name

  # These fields are protected from mass assignment.  You cannot call User.new(...) with these attributes.  You must
  # set them singly.
  attr_protected :is_admin, :is_member

  # Association with orders
  has_many :orders

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
