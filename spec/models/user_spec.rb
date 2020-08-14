require 'rails_helper'

RSpec.describe User do
  describe '#create' do

    context 'can save' do
      it '必須項目が入力されている場合は登録できること' do
        user = build(:user)
        expect(user).to be_valid
      end
      
      it 'ユーザー本名の名字が全角（漢字）である場合は登録できること' do
        user = build(:user, last_name: "山田")
        expect(user).to be_valid
      end
      
      it 'ユーザー本名の名字が全角（ひらがな）である場合は登録できること' do
        user = build(:user, last_name: "やまだ")
        expect(user).to be_valid
      end
      
      it 'ユーザー本名の名字が全角（カタカナ）である場合は登録できること' do
        user = build(:user, last_name: "ヤマダ")
        expect(user).to be_valid
      end
      
      it 'ユーザー本名の名前が全角（漢字）である場合は登録できること' do
        user = build(:user, first_name: "次郎")
        expect(user).to be_valid
      end
      
      it 'ユーザー本名の名前が全角（ひらがな）である場合は登録できること' do
        user = build(:user, first_name: "じろう")
        expect(user).to be_valid
      end
      
      it 'ユーザー本名の名前が全角（カタカナ）である場合は登録できること' do
        user = build(:user, first_name: "ジロウ")
        expect(user).to be_valid
      end

      it 'ユーザー本名の名字のふりがなが全角カタカナである場合は登録できること' do
        user = build(:user, last_name_kana: "ヤマダ")
        expect(user).to be_valid
      end
      
      it 'ユーザー本名の名前のふりがなが全角カタカナである場合は登録できること' do
        user = build(:user, first_name_kana: "ジロウ")
        expect(user).to be_valid
      end

      it 'パスワードが7文字以上であれば登録できること' do
        user = build(:user, password: "0000000", password_confirmation: "0000000")
        expect(user).to be_valid
      end

    end

    context 'can not save' do
      it 'ニックネームが入力されていない場合は登録できないこと' do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end
      
      it 'メールアドレスが入力されていない場合は登録できないこと' do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
      
      it 'パスワードが入力されていない場合は登録できないこと' do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
      
      it 'パスワードが6文字以下であれば登録できないこと' do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user.errors[:password]).to include("は7文字以上で入力してください")
      end
      
      it 'パスワードが入力されていても確認用のパスワードが入力されていない場合は登録できないこと' do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
      end
      
      it 'パスワードと確認用のパスワードが一致しない場合は登録できないこと' do
        user = build(:user, password_confirmation: "1234567")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
      end
      
      it 'ユーザー本名の名字が入力されていない場合は登録できないこと' do
        user = build(:user, last_name: "")
        user.valid?
        expect(user.errors[:last_name]).to include("を入力してください")
      end
      
      it 'ユーザー本名の名前が入力されていない場合は登録できないこと' do
        user = build(:user, first_name: "")
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
      end
      
      it 'ユーザー本名の名字のふりがなが入力されていない場合は登録できないこと' do
        user = build(:user, last_name_kana: "")
        user.valid?
        expect(user.errors[:last_name_kana]).to include("を入力してください")
      end
      
      it 'ユーザー本名の名前のふりがなが入力されていない場合は登録できないこと' do
        user = build(:user, first_name_kana: "")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("を入力してください")
      end

      it 'ユーザー本名の名字が半角の場合は登録できないこと' do
        user = build(:user, last_name: "ﾔﾏﾀﾞ")
        user.valid?
        expect(user.errors[:last_name]).to include("は全角で入力して下さい")
      end
      
      it 'ユーザー本名の名前が半角の場合は登録できないこと' do
        user = build(:user, first_name: "ｼﾞﾛｳ")
        user.valid?
        expect(user.errors[:first_name]).to include("は全角で入力して下さい")
      end
  
      it 'ユーザー本名の名字のふりがなが全角カタカナでない場合は登録できないこと' do
        user = build(:user, last_name_kana: "さとう")
        user.valid?
        expect(user.errors[:last_name_kana]).to include("は全角カタカナで入力して下さい")
      end
      
      it 'ユーザー本名の名前のふりがなが全角カタカナでない場合は登録できないこと' do
        user = build(:user, first_name_kana: "じろう")
        user.valid?
        expect(user.errors[:first_name_kana]).to include("は全角カタカナで入力して下さい")
      end
      
      it '生年月日の年が入力されていない場合は登録できないこと' do
        user = build(:user, birth_year: "")
        user.valid?
        expect(user.errors[:birth_year]).to include("を入力してください")
      end
      
      it '生年月日の月が入力されていない場合は登録できないこと' do
        user = build(:user, birth_month: "")
        user.valid?
        expect(user.errors[:birth_month]).to include("を入力してください")
      end
      
      it '生年月日の日が入力されていない場合は登録できないこと' do
        user = build(:user, birth_day: "")
        user.valid?
        expect(user.errors[:birth_day]).to include("を入力してください")
      end

    end

  end

end