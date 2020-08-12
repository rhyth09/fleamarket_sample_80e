require 'rails_helper'

RSpec.describe Image, type: :model do
  it 'srcとitem_idがあれば登録できること' do
    image = build(:image)
    expect(image).to be_valid
  end
  
  it 'srcが必須であること' do
    image = build(:image, src: nil)
    image.valid?
    expect(image.errors[:src]).to include("を入力してください")
  end
end
