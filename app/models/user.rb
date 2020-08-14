class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :address, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day ,presence: true

  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 7 }
  validates :last_name, :first_name, presence: true
  validates :last_name_kana, :first_name_kana, presence: true
  validates :birth_year, :birth_month, :birth_day, presence: true
end