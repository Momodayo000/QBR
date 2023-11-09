class Tag < ApplicationRecord
  has_many :notice_tags,dependent: :destroy, foreign_key: 'tag_id'
  # タグは複数の投稿を持つ　それは、notice_tagsを通じて参照できる
  has_many :notices,through: :notice_tags

  validates :name, uniqueness: true, presence: true
end
