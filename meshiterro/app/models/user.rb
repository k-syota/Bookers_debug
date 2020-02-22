class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_imame, dependent: :destroy
  has_many :post_comment, dependent: :destroy
  has_many :favorite, dependent: :destroy
  attachment :profile_image
end
