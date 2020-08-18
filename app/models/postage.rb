class Postage < ActiveHash::Base
  include ActiveHash::Associations
  field :choice
  add id: 1, choice: "1~2日で発送"
  add id: 2, choice: "2~3日で発送"
  add id: 3, choice: "4~7日で発送"

  has_many :items
end