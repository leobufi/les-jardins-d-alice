class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :articles
  has_many :categories
  has_many :coffrets
  has_many :formations
  has_many :jardins
  has_many :products
  has_many :rayons

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
