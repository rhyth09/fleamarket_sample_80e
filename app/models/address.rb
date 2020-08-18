class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :send_last_name, :send_first_name,  presence: true,
                                                format: {
                                                with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
                                                message: "は全角で入力して下さい"
                                                }
validates :send_last_name_kana, :send_first_name_kana,  presence: true,
                                                        format: {
                                                        with: /\A[ァ-ヶー－]+\z/,
                                                        message: "は全角カタカナで入力して下さい"
                                                        }

validates :postal_code, :prefecture_id, :city, :address ,presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end