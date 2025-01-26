class Book < ApplicationRecord
  # スコープの定義
  # 繰り返し利用するクエリの再利用性が上がる
  # クエリに名前をつけることで、可読性が向上する
  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, ->(them) { where("name like ?", "%#{them}%")}
  scope :find_price, ->(price) { find_by_price(price) }
end

# rails c 5件データを入れる処理
# (1..5).each do |i|
#   Book.create(
#     name: "Book #{i}",
#     published_on: Time.parse("2019224").ago(i.months),
#     price: (i*1000),
#     )
# end
