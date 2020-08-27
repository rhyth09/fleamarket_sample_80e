crumb :root do
  link "トップページ", root_path
end

# マイページから
crumb :mypage do
  link "マイページ", user_path
end

crumb :sales_items do
  link "出品中の商品", sales_items_user_path(current_user.id)
  parent :mypage
end

crumb :sold_items do
  link "売却済みの商品", sold_items_user_path(current_user.id)
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_user_path(current_user.id)
  parent :mypage
end