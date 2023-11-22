class Menu < ApplicationRecord

  validates :menu_title, presence: true
  validates :menu_sub_title, presence: true
  validates :menu_explanation, presence: true
  validates :price, presence: true
end
