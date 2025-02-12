class User < ApplicationRecord
  validates :name, presence: true
  has_many :comments
  has_one_attached :portrait
  # thumb
  has_one_attached :portrait do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ]
  end

  def self.find_or_create_from_auth_hash!(auth_hash)
    # 引数で渡したproviderとuidを持つレコードが存在していれば、そのオブジェクトを返す
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    # 引数で渡してproviderとuidを持つレコードが存在していれば、そのオブジェクトを返す
    User.find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name = nickname
      user.image_url = image_url
    end
  end
end
