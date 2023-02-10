class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        has_many :posts
        has_many :foods
        validates :name, presence: true #追記
        validates :profile, length: { maximum: 200 }
end
