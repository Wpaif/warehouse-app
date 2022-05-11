class Supplier < ApplicationRecord
  validates :brand_name, :corporate_name, :registered_number, :email, presence: true
  validates :registered_number, uniqueness: true
  validates :registered_number, length: { is: 13 }
  validates :phone_number, format: { with: /\A([(]\d{2}[)]|\d{2})\s?\d{1}\s?(\d{8}|\d{4}-?\d{4})\z/ }
  validates :email,
            format: { with: /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i }
end
