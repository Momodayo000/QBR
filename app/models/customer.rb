class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  GUEST_CUSTOMER_EMAIL = "guest@example.com"
    def self.guest
      find_or_create_by!(email: GUEST_CUSTOMER_EMAIL) do |customer|
        customer.password = SecureRandom.urlsafe_base64
        customer.last_name = "太郎"
        customer.first_name = "田中"
        customer.last_name_furigana = "タロウ"
        customer.first_name_furigana = "タナカ"
        customer.telephone_number = "08012345678"
      end
    end

  def guest_customer?
    email == GUEST_CUSTOMER_EMAIL
  end

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

end
