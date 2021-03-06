class Contact < ApplicationRecord
   # お問合せフォームバリデーション
   validates :name, presence: true, length:{minimum: 2,maximum: 30} #場所名
   validates :email, presence: true  #メールアドレス
   validates :message, presence: true, length:{minimum: 2,maximum: 300} #メッセージ
end
