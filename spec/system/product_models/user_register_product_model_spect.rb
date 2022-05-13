require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'Usuário registra um produto' do
  it 'a partir da homepage' do
    Supplier.create!(brand_name: 'Apple', corporate_name: 'Apple SA',
                     registered_number: 1_234_567_891_234, full_address: 'Stone street, 0',
                     email: 'sac@apple.com', phone_number: '(11) 9 1234-5678')

    visit root_path
    click_on 'Modelos de produtos'
    click_on 'Cadastrar Produto'

    expect(current_path).to eq new_product_model_path
    expect(page).to have_field 'Nome', type: 'text'
    expect(page).to have_field 'Peso', type: 'number'
    expect(page).to have_field 'Largura', type: 'number'
    expect(page).to have_field 'Altura', type: 'number'
    expect(page).to have_field 'Profundidade', type: 'number'
    expect(page).to have_field 'SKU', type: 'text'
    expect(page).to have_css 'input[type="submit"]'
  end

  it 'com sucesso' do
    Supplier.create!(brand_name: 'Apple', corporate_name: 'Apple SA',
                     registered_number: 1_234_567_891_234, full_address: 'Stone street, 0',
                     email: 'sac@apple.com', phone_number: '(11) 9 1234-5678')
    visit root_path
    click_on 'Modelos de produtos'
    click_on 'Cadastrar Produto'

    fill_in 'Nome',	with: 'Iphone'
    fill_in 'Peso',	with: '150'
    fill_in 'Largura',	with: '6'
    fill_in 'Altura',	with: '15'
    fill_in 'Profundidade',	with: '1'
    fill_in 'SKU', with: 'IPHO-APPLE-XPTO90-HJLPO'
    select 'Apple', from: 'product_model_supplier_id'
    click_on 'Criar Produto'

    expect(current_path).to eq product_model_path(ProductModel.last)
  end
end
# rubocop:enable Metrics/BlockLength
