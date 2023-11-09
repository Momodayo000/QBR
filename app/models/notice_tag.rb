class NoticeTag < ApplicationRecord
  belongs_to :notice
  belongs_to :tag
  validates :notice_id, presence: true
  validates :tag_id, presence: true
end
