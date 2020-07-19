class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  inheritance_column = nil
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :superadmin, :moderator]

  def admin?
    %w(superadmin moderator).include? role
  end
end
