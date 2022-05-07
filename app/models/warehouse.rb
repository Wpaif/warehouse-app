class Warehouse < ApplicationRecord
  validates :name, :description, :code, :address, :city, :cep, :area, presence: true
  validates :code, :name, uniqueness: true
  validates :cep, format: { with: /\A\d{5}-?\d{3}\z/ }
  validates :code, length: { is: 3 }
end
