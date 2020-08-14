class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :address, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, length: { minimum: 7 }
  validates :last_name, :first_name,  presence: true,
                                                format: {
                                                with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
                                                message: "は全角で入力して下さい"
                                                }
  validates :last_name_kana, :first_name_kana,  presence: true,
                                                format: {
                                                with: /\A[ァ-ヶー－]+\z/,
                                                message: "は全角カタカナで入力して下さい"
                                                }
  validates :birth_year, :birth_month, :birth_day, presence: true
end