class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations
  has_many :reviews,dependent: :destroy

  with_options presence: do
    validates :last_name
    validates :first_name
    validates :last_name_furigana
    validates :first_name_furigana
    validates :telephone_number
    validates :email
  end

  def full_name = self.last_name + "　" + self.first_name

  def full_name_furigana = self.last_name_furigana + "　" + self.first_name_furigana

  enum gender: { 男: 0, 女: 1}

end
