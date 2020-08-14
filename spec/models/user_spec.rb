require 'rails_helper'

RSpec.describe User do
  describe '#create' do

    context 'can save' do
      it '必須項目が入力されていれば登録できること' do
        user = build(:user)
        expect(user).to be_valid
      end

      it 'パスワードが7文字以上であれば登録できること' do
        user = build(:user, password: "0000000", password_confirmation: "0000000")
        expect(user).to be_valid
      end
      
      
    end
    
    context 'can not save' do
      it 'ニックネームが必須であること' do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end
      
      it 'メールアドレスが必須であること' do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
      
      it 'パスワードが必須であること' do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
      
      it 'パスワードが6文字以下であれば登録できないこと' do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user.errors[:password]).to include("は7文字以上で入力してください")
      end
      
      it 'パスワードを2回入力する必要があること' do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
      end
      
      it 'ユーザー本名の名字が必須であること' do
        user = build(:user, last_name: "")
        user.valid?
        expect(user.errors[:last_name]).to include("を入力してください")
      end
      
      it 'ユーザー本名の名前が必須であること' do
        user = build(:user, first_name: "")
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
      end
      
      it 'ユーザー本名の名字のふりがなが必須であること' do
        user = build(:user, last_name_kana: "")
        user.valid?
        expect(user.errors[:last_name_kana]).to include("を入力してください")
      end
      
      it 'ユーザー本名の名前のふりがなが必須であること' do
        user = build(:user, first_name_kana: "")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください")
      end
      
      it '生年月日の年が必須であること' do
        user = build(:user, birth_year: "")
        user.valid?
        expect(user.errors[:birth_year]).to include("を入力してください")
      end
      
      it '生年月日の月が必須であること' do
        user = build(:user, birth_month: "")
        user.valid?
        expect(user.errors[:birth_month]).to include("を入力してください")
      end
      
      it '生年月日の日が必須であること' do
        user = build(:user, birth_day: "")
        user.valid?
        expect(user.errors[:birth_day]).to include("を入力してください")
      end

    end

  end
end
