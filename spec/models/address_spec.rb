require 'rails_helper'

RSpec.describe Address do
  describe '#create_address' do

    context 'can save' do
      it '必須項目が入力されている場合は登録できること' do
        address = build(:address)
        expect(address).to be_valid
      end
      
      it '送付先氏名の名字が全角（漢字）である場合は登録できること' do
        address = build(:address, send_last_name: "山田")
        expect(address).to be_valid
      end
      
      it '送付先氏名の名字が全角（ひらがな）である場合は登録できること' do
        address = build(:address, send_last_name: "やまだ")
        expect(address).to be_valid
      end
      
      it '送付先氏名の名字が全角（カタカナ）である場合は登録できること' do
        address = build(:address, send_last_name: "ヤマダ")
        expect(address).to be_valid
      end
      
      it '送付先氏名の名前が全角（漢字）である場合は登録できること' do
        address = build(:address, send_first_name: "次郎")
        expect(address).to be_valid
      end

      it '送付先氏名の名前が全角（ひらがな）である場合は登録できること' do
        address = build(:address, send_first_name: "じろう")
        expect(address).to be_valid
      end

      it '送付先氏名の名前が全角（カタカナ）である場合は登録できること' do
        address = build(:address, send_first_name: "ジロウ")
        expect(address).to be_valid
      end

      it '送付先氏名の名字のふりがなが全角（カタカナ）である場合は登録できること' do
        address = build(:address, send_last_name_kana: "ヤマダ")
        expect(address).to be_valid
      end

      it '送付先氏名の名前のふりがなが全角（カタカナ）である場合は登録できること' do
        address = build(:address, send_first_name_kana: "ジロウ")
        expect(address).to be_valid
      end
      
      it '建物名と部屋番号が登録できること' do
        address = build(:address, build_name: "柳ビル103")
        expect(address).to be_valid
      end
      
      it 'お届け先の電話番号登録できること' do
        address = build(:address, phone_number: "09012345678")
        expect(address).to be_valid
      end

    end

    context 'can not save' do
      it '送付先氏名の名字が入力されていない場合は登録できないこと' do
        address = build(:address, send_last_name: "")
        address.valid?
        expect(address.errors[:send_last_name]).to include("を入力してください")
      end
      
      it '送付先氏名の名字が半角カタカナの場合は登録できないこと' do
        address = build(:address, send_last_name: "ﾔﾏﾀﾞ")
        address.valid?
        expect(address.errors[:send_last_name]).to include("は全角で入力して下さい")
      end

      it '送付先氏名の名前が入力されていない場合は登録できないこと' do
        address = build(:address, send_first_name: "")
        address.valid?
        expect(address.errors[:send_first_name]).to include("を入力してください")
      end
      
      it '送付先氏名の名前が半角カタカナの場合は登録できないこと' do
        address = build(:address, send_first_name: "ｼﾞﾛｳ")
        address.valid?
        expect(address.errors[:send_first_name]).to include("は全角で入力して下さい")
      end
      
      it '送付先氏名の名字のふりがなが入力されていない場合は登録できないこと' do
        address = build(:address, send_last_name_kana: "")
        address.valid?
        expect(address.errors[:send_last_name_kana]).to include("を入力してください")
      end
      
      it '送付先氏名の名字のふりがなが全角（漢字）の場合は登録できないこと' do
        address = build(:address, send_last_name_kana: "山田")
        address.valid?
        expect(address.errors[:send_last_name_kana]).to include("は全角カタカナで入力して下さい")
      end
      
      it '送付先氏名の名字のふりがなが全角（ひらがな）の場合は登録できないこと' do
        address = build(:address, send_last_name_kana: "やまだ")
        address.valid?
        expect(address.errors[:send_last_name_kana]).to include("は全角カタカナで入力して下さい")
      end
      
      it '送付先氏名の名字のふりがなが半角カタカナの場合は登録できないこと' do
        address = build(:address, send_last_name_kana: "ﾔﾏﾀﾞ")
        address.valid?
        expect(address.errors[:send_last_name_kana]).to include("は全角カタカナで入力して下さい")
      end
      
      it '送付先氏名の名前のふりがなが入力されていない場合は登録できないこと' do
        address = build(:address, send_first_name_kana: "")
        address.valid?
        expect(address.errors[:send_first_name_kana]).to include("を入力してください")
      end
      
      it '送付先氏名の名前のふりがなが全角（漢字）の場合は登録できないこと' do
        address = build(:address, send_first_name_kana: "次郎")
        address.valid?
        expect(address.errors[:send_first_name_kana]).to include("は全角カタカナで入力して下さい")
      end
      
      it '送付先氏名の名前のふりがなが全角（ひらがな）の場合は登録できないこと' do
        address = build(:address, send_first_name_kana: "じろう")
        address.valid?
        expect(address.errors[:send_first_name_kana]).to include("は全角カタカナで入力して下さい")
      end
      
      it '送付先氏名の名前のふりがなが半角カタカナの場合は登録できないこと' do
        address = build(:address, send_first_name_kana: "ｼﾞﾛｳ")
        address.valid?
        expect(address.errors[:send_first_name_kana]).to include("は全角カタカナで入力して下さい")
      end

      it '郵便番号が入力されていない場合は登録できないこと' do
        address = build(:address, postal_code: "")
        address.valid?
        expect(address.errors[:postal_code]).to include("を入力してください")
      end

      it '都道府県が入力されていない場合は登録できないこと' do
        address = build(:address, prefecture_id: "")
        address.valid?
        expect(address.errors[:prefecture_id]).to include("を入力してください")
      end

      it '市区町村が入力されていない場合は登録できないこと' do
        address = build(:address, city: "")
        address.valid?
        expect(address.errors[:city]).to include("を入力してください")
      end

      it '番地が入力されていない場合は登録できないこと' do
        address = build(:address, address: "")
        address.valid?
        expect(address.errors[:address]).to include("を入力してください")
      end

    end

  end

end