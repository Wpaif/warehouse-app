require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'Usuário vê a listagem de produtos' do
  it 'a partir da homepage' do
    Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung SA',
                     registered_number: 8_234_567_891_234, full_address: 'Rua dos Bobos, 0',
                     email: 'samsung@samsung.com', phone_number: '(11) 9 1234-5678')

    ProductModel.create!(name: 'TV 32"', weight: 8000, width: 70, height: 45, depth: 10,
                         sku: 'TV32-SAMSU-XXPTOR-ASDFG', supplier: Supplier.last)

    visit root_path
    click_on 'Modelos de produtos'

    expect(current_path).to eq product_models_path
  end

  it 'com produtos cadastrados' do
    Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung SA',
                     registered_number: 8_234_567_891_234, full_address: 'Rua dos Bobos, 0',
                     email: 'samsung@samsung.com', phone_number: '(11) 9 1234-5678')

    ProductModel.create!(name: 'TV 32"', weight: 8000, width: 70, height: 45, depth: 10,
                         sku: 'TV32-SAMSU-XXPTOR-ASDFG', supplier: Supplier.last)

    visit root_path
    click_on 'Modelos de produtos'

    expect(page).to have_css 'h2', text: 'Modelos de Produtos'
    within('section') do
      expect(page).to have_css 'h3', text: 'TV 32"'
      expect(page).to have_css 'dl dt', text: 'SKU'
      expect(page).to have_css 'dl dd', text: 'TV32-SAMSU-XXPTOR-ASDFG'
      expect(page).to have_css 'dl dt', text: 'Fornecedor'
      expect(page).to have_css 'dl dd', text: 'Samsung'
      expect(page).not_to have_css 'p', text: 'Não há produtos cadastrados'
    end
  end

  it 'e não há produtos cadastrados' do
    visit root_path
    click_on 'Modelos de produtos'

    expect(page).to have_content 'Não há produtos cadastrados'
  end
end
# rubocop:enable Metrics/BlockLength
