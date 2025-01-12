class DoNotSell < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\+?[\d\s\-\(\)]+\z/, message: "format is invalid" }, allow_blank: true
end
