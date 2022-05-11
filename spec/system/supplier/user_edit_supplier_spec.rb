require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'Usuário edita fornecedor' do
  it 'a partir da tela de detalhes' do
    supplier = Supplier.create!(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                                registered_number: 1_234_567_891_234, full_address: 'Rua dos Bobos, 0',
                                email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

    visit root_path
    click_on 'Fornecedores'
    click_on 'Organizações Tabajara'
    click_on 'Editar'

    expect(current_path).to eq edit_supplier_path(Supplier.first)
    expect(page).to have_css 'h2', text: 'Editar Fornecedor'

    within('form') do
      expect(page).to have_field 'Nome', type: 'text', with: supplier.brand_name
      expect(page).to have_field 'Razão Social', type: 'text', with: supplier.corporate_name
      expect(page).to have_field 'CNPJ', type: 'number', with: supplier.registered_number
      expect(page).to have_field 'Endereço', type: 'text', with: supplier.full_address
      expect(page).to have_field 'Email', type: 'email', with: supplier.email
      expect(page).to have_field 'Telefone', type: 'tel', with: supplier.phone_number
      expect(page).to have_css 'input[type="submit"]'
    end

    expect(page).to have_link 'Voltar'
  end

  it 'com sucesso' do
    Supplier.create!(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                     registered_number: 1_234_567_891_234, full_address: 'Rua dos Bobos, 0',
                     email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

    visit root_path
    click_on 'Fornecedores'
    click_on 'Organizações Tabajara'
    click_on 'Editar'

    fill_in 'Nome',	with: 'Rei da Pamonha'
    fill_in 'Razão Social',	with: 'Pamonha SA'
    fill_in 'CNPJ',	with: '1234567891234'
    fill_in 'Endereço',	with: 'Rua do Pipoco, 10'
    fill_in 'Email', with: 'pamonha@pamonha.com'
    fill_in 'Telefone',	with: '99999999999'
    click_on 'Atualizar Fornecedor'

    expect(current_path).to eq supplier_path(Supplier.first)
    expect(page).to have_css 'h2', text: 'Rei da Pamonha'
    within('section') do
      expect(page).to have_content 'Razão Social: Pamonha SA'
      expect(page).to have_content 'CNPJ: 1234567891234'
      expect(page).to have_content 'Endereço: Rua do Pipoco, 10'
      expect(page).to have_content 'Email: pamonha@pamonha.com'
      expect(page).to have_content 'Telefone: 99999999999'
    end
  end

  it 'sem os capos obrigatórios' do
    Supplier.create!(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                     registered_number: 1_234_567_891_234, full_address: 'Rua dos Bobos, 0',
                     email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

    visit root_path
    click_on 'Fornecedores'
    click_on 'Organizações Tabajara'
    click_on 'Edit'

    fill_in 'Nome',	with: ''
    fill_in 'Razão Social',	with: ''
    fill_in 'CNPJ',	with: ''
    fill_in 'Email', with: ''
    click_on 'Atualizar Fornecedor'

    expect(page).to have_css 'ul li', text: 'Nome não pode ficar em branco'
    expect(page).to have_css 'ul li', text: 'Razão Social não pode ficar em branco'
    expect(page).to have_css 'ul li', text: 'CNPJ não pode ficar em branco'
    expect(page).to have_css 'ul li', text: 'Email não pode ficar em branco'
    expect(page).to have_css 'ul li', text: 'CNPJ não possui o tamanho esperado (13 caracteres)'
  end
end
# rubocop:enable Metrics/BlockLength
