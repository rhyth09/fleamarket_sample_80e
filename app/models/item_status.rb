class ItemStatus < ActiveHash::Base
  include ActiveHash::Associations
  field :choice
  add :id => 1, :choice => "新品、未使用"
  add :id => 2, :choice => "未使用に近い"
  add :id => 3, :choice => "目立った傷や汚れなし"
  add :id => 4, :choice => "やや傷や汚れあり"
  add :id => 5, :choice => "傷や汚れあり"
  add :id => 6, :choice => "全体的に状態が悪い"

  has_many :items
end