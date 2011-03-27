class AuthorizeNetCredential < ActiveRecord::Base
  validates_presence_of :username, :password
  validate :must_have_one_credential

  def must_have_one_credential
    self.count.equal? 1
  end
end
