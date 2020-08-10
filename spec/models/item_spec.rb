require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do

    context 'can save' do
      it 'name, price, explain, prefecture_id, shipping_date_id, item_status_id, postage_idがあれば登録できること' do
        item = build(:item)
        expect(item).to be_valid
      end

      it 'brandが登録できること' do
        item = build(:item, size: "example size")
        expect(item).to be_valid
      end

      it 'brandが登録できること' do
        item = build(:item, brand: "example brand")
        expect(item).to be_valid
      end
    end

    context 'can not save' do
      it 'sizeが必須ではないこと' do
        item = build(:item, size: "")
        expect(item).to be_valid
      end

      it 'brandが必須ではないこと' do
        item = build(:item, brand: "")
        expect(item).to be_valid
      end

      it 'nameが必須であること' do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end

      it 'priceが必須であること' do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end

      it 'explainが必須であること' do
        item = build(:item, explain: "")
        item.valid?
        expect(item.errors[:explain]).to include("can't be blank")
      end

      it 'prefecture_idが必須であること' do
        item = build(:item, prefecture_id: "")
        item.valid?
        expect(item.errors[:prefecture_id]).to include("can't be blank")
      end

      it 'shipping_date_idが必須であること' do
        item = build(:item, shipping_date_id: "")
        item.valid?
        expect(item.errors[:shipping_date_id]).to include("can't be blank")
      end

      it 'item_status_idが必須であること' do
        item = build(:item, item_status_id: "")
        item.valid?
        expect(item.errors[:item_status_id]).to include("can't be blank")
      end

      it 'postage_idが必須であること' do
        item = build(:item, postage_id: "")
        item.valid?
        expect(item.errors[:postage_id]).to include("can't be blank")
      end

      it 'categoryが必須であること' do
        item = build(:item, category: nil)
        item.valid?
        expect(item.errors[:category]).to include("must exist")
      end

    end
  end
end