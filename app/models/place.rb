class Place < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :region
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :place_comments, dependent: :destroy
  # 地図表示、緯度経度
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
# 　いいね
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  validates :name, presence: true, length:{minimum: 2,maximum: 30} #場所名
  validates :explanation, presence: true, length:{maximum: 300}  #場所説明
end
