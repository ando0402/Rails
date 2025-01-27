class Book < ApplicationRecord
  # スコープの定義
  # 繰り返し利用するクエリの再利用性が上がる
  # クエリに名前をつけることで、可読性が向上する
  scope :costly, -> { where("price > ?", 3000) }
  scope :written_about, ->(them) { where("name like ?", "%#{them}%")}
  scope :find_price, ->(price) { find_by_price(price) }

  # リレーション
  belongs_to :publisher
  has_many :book_authors
  has_many :authors, through: :book_authors

  validates :name, :price, presence: true
  validates :name, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal_to:  0 }

  before_validation do
    self.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end
  after_destroy do
    Rails.logger.info "Book is deleted: #{self.attributes}"
  end
  # あるいはメソッドを使って以下のようにも書ける
  # before_validation :add_lovely_to_cat
  #
  # def add_lovely_to_cat
  #   self.name = self.name.gsub(/Cat/) do |matched|
  #     "lovely #{matched}"
  #   end
  # end

  # 独自バリデーション
  validate do |book|
    if book.name.include?("exercise")
      book.errors[:name] << " I dont like exercise."
    end
  end

  # 価格が5000円以上の時に警告エラー
  after_destroy if: :high_price? do
    Rails.logger.info "Book is deleted: #{self.inspect}"
    Rails.logger.warn "Please check!!"
  end
  def high_price?
    price >= 5000
  end

  # enum sales_status: {
  #   reservation: 0, # 予約受付
  #   now_on_sale: 1, # 販売中
  #   end_of_print: 2 # 販売終了
  # }

  enum :sales_status, {
    reservation: 0, # 予約受付
    now_on_sale: 1, # 販売中
    end_of_print: 2 # 販売終了
  }

  # enumのデータ入れる場合
  # Book.create(
  #   name: "enum Book 1",
  #   sales_status: "now_on_sale",
  #   publisher: Publisher.find(1),
  #   price: 1000,
  # )

end




# rails c 5件データを入れる処理
# (1..5).each do |i|
#   Book.create(
#     name: "Book #{i}",
#     published_on: Time.parse("2019224").ago(i.months),
#     price: (i*1000),
#     )
# end

# 情報登録
# publisher = Publisher.create(
#   name: "Gihyo inc.",
#   address: "Ichigaya",
# )

#　1.リレーション情報
# publisher.books << Book.create(
#   name: "Book 1",
#   published_on: Time.current,
#   price: 1000,
# )

#　2.リレーション情報
# publisher.books << Book.create(
#   name: "Book 2",
#   published_on: Time.current,
#   price: 2000,
# )

# モデルを通してデータ更新(1) 下の処理と同じ
# Book.create(
#   name: "Rails Book",
#   published_on: Time.parse("20191224").ago(2.months),
#   price: 1000,
#   publisher: Publisher.find(1),
# )

# モデルを通してデータ更新(1) 下の処理と同じ
# book = Book.new
# book.name = "Rails book"
# book.published_on = Time.parse("20191224").ago(2.months)
# book.price = 2980
# book.publisher = Publisher.find_by(1)
# book.save
