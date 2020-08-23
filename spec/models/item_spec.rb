require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '#create' do
    context 'can save' do
      it '必須項目があれば登録できること' do
        item = build(:item)
        expect(item).to be_valid
      end

      it 'sizeが登録できること' do
        item = build(:item, size: "example size")
        expect(item).to be_valid
      end

      it 'brandが登録できること' do
        item = build(:item, brand: "example brand")
        expect(item).to be_valid
      end
    end

    context 'can not save' do
      it 'name（商品名）が必須であること' do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end
      
      it 'explain（商品の説明）が必須であること' do
        item = build(:item, explain: "")
        item.valid?
        expect(item.errors[:explain]).to include("を入力してください")
      end
      
      it 'category_id（カテゴリーの情報）が必須であること' do
        item = build(:item, category: nil)
        item.valid?
        expect(item.errors[:category]).to include("を入力してください")
      end
      
      it 'item_status_id（商品の状態についての情報）が必須であること' do
        item = build(:item, item_status_id: "")
        item.valid?
        expect(item.errors[:item_status_id]).to include("を入力してください")
      end
      
      it 'postage_id（配送料の負担についての情報）が必須であること' do
        item = build(:item, postage_id: "")
        item.valid?
        expect(item.errors[:postage_id]).to include("を入力してください")
      end
      
      it 'prefecture_id（発送元の地域についての情報）が必須であること' do
        item = build(:item, prefecture_id: "")
        item.valid?
        expect(item.errors[:prefecture_id]).to include("を入力してください")
      end
      
      it 'shipping_date_id（発送までの日数についての情報）が必須であること' do
        item = build(:item, shipping_date_id: "")
        item.valid?
        expect(item.errors[:shipping_date_id]).to include("を入力してください")
      end

      it 'price（価格についての情報）が必須であること' do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it 'seller（出品ユーザーのID）が必須であること' do
        item = build(:item, seller: nil)
        item.valid?
        expect(item.errors[:seller]).to include("を入力してください")
      end

      it '画像の投稿が必須であること' do
        item = Item.new(name: "sample", price: 300, explain: "sample", prefecture_id: 1, shipping_date_id: 1, item_status_id: 2, postage_id: 2, category_id:1)
        item.valid?
        expect(item.errors[:images]).to include("は一枚以上必須です")
      end  
    end
  end
  
end