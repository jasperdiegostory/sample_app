# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base 
  attr_accessible :name, :email, :password, :password_confirmation 
  #these attributes, and only these attributes, are accessible (can be modified by outside users)
  has_secure_password #built in. needs model column "password_digest". built in functionality includes raw passwords are viritual (not persisted to database). this also tests that password is the same as password confirmation, and also that the :password entered matches the password-digest column in the database.

  before_save { |user| user.email = email.downcase } #before committing to memory, emails are standardized
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 } # name is validated as long as it exists and is no more than 50 maxs
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #REGEX means regular expression; it is a constant (capital starting letter)
  validates :email, presence:   true, # exists at all
                    format:     { with: VALID_EMAIL_REGEX }, #must satisfy the validation requirements in REGEX 
                    uniqueness: { case_sensitive: false } #validates uniqueness on the email, where JaSpEr@ViEwSy.CoM/jasper@viewsy.com/JASPER@VIEWSY.COM are all treated the same
  validates :password, presence: true, length: { minimum: 6 } # password must exist, and must be minimum of 6 characters
  validates :password_confirmation, presence: true # password confirmation must exist (elsewhere we validate it is the same as password)

  private

   def create_remember_token
  self.remember_token = SecureRandom.urlsafe_base64
end
end
