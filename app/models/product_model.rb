class ProductModel < ApplicationRecord
  belongs_to :supplier

  validates :name, :weight, :width, :height, :depth, :sku, :supplier, presence: true
  validates :sku, format: { with: /\A\w{4}-?\w{5}-?\w{6}-?\w{5}\z/ }
  validates :sku, uniqueness: true
  validates :weight, :width, :height, :depth, numericality: { greater_than: 0 }
end
