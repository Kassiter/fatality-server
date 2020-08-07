require 'active_support'

class User < ApplicationRecord
  connects_to database: { writing: :primary, reading: :primary }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  inheritance_column = nil
  has_many :personal_items
  has_many :contests_users
  has_many :moder_contests_users
  has_one :refund

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :superadmin, :moderator, :cto]

  validates_uniqueness_of :steamID
  validates_uniqueness_of :email

  def admin?
    %w(superadmin moderator).include? role
  end

  def moder?
    %w(moderator).include? role
  end

  def title
    nickname
  end

  def moder
    Moder.where(id: id).last
  end

  def generate_auth_token!
    tokens = Devise.token_generator.generate(User,:auth_token)

    auth_token_plain = tokens.second
    self.update!(auth_token: auth_token_plain)
    tokens.first
  end

  def auth_token_valid?(encoded_token)
    Devise.token_generator.digest(User,:auth_token, encoded_token) == self.auth_token
  end
end
