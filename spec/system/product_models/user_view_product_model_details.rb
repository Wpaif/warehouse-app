require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'Usuário vê os detalhes de produtos' do
  it 'a partir da homepage' do
    Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung SA',
                     registered_number: 9_234_567_891_234, full_address: 'Rua dos Bobos, 0',
                     email: 'samsung@samsung.com', phone_number: '(11) 9 1234-5678')

    ProductModel.create!(name: 'TV 32"', weight: 8000, width: 70, height: 45, depth: 10,
                         sku: 'TV32-SAMSU-XXPTOR-ASDFG', supplier: Supplier.last)
    visit root_path
    click_on 'Modelos de produtos'
    click_on 'Ver detalhes'

    expect(current_path).to eq product_model_path(ProductModel.last)
  end

  it 'com sucesso' do
    Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung SA',
                     registered_number: 9_234_567_891_234, full_address: 'Rua dos Bobos, 0',
                     email: 'samsung@samsung.com', phone_number: '(11) 9 1234-5678')

    ProductModel.create!(name: 'TV 32"', weight: 8000, width: 70, height: 45, depth: 10,
                         sku: 'TV32-SAMSU-XXPTOR-ASDFG', supplier: Supplier.last)
    visit root_path
    click_on 'Modelos de produtos'
    click_on 'Ver detalhes'

    expect(page).to have_css 'h2', text: 'TV 32" - Samsung'
    expect(page).to have_css 'dt', text: 'Peso'
    expect(page).to have_css 'dd', text: '8000g'

    expect(page).to have_css 'dt', text: 'Largura'
    expect(page).to have_css 'dd', text: '70cm'

    expect(page).to have_css 'dt', text: 'Altura'
    expect(page).to have_css 'dd', text: '45cm'

    expect(page).to have_css 'dt', text: 'Profundidade'
    expect(page).to have_css 'dd', text: '10cm'

    expect(page).to have_css 'dt', text: 'SKU'
    expect(page).to have_css 'dd', text: 'TV32-SAMSU-XXPTOR-ASDFG'
  end
end
# rubocop:enable Metrics/BlockLength
