require 'rails_helper'

# rubocop:disable Metrix/BlockLength
describe 'Usuário registra fornecedor' do
  it 'a partir da página inicial' do
    # Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Registrar Fornecedor'

    expect(page).to have_css 'h2', text: 'Regirstrar Fornecedor'
    within('form[action="/suppliers"]') do
      expect(current_path).to eq new_supplier_path
      expect(page).to have_field 'Nome', type: 'text'
      expect(page).to have_field 'Razão Social', type: 'text'
      expect(page).to have_field 'CNPJ', type: 'number'
      expect(page).to have_field 'Endereço', type: 'text'
      expect(page).to have_field 'Email', type: 'email'
      expect(page).to have_field 'Telefone', type: 'tel'
      expect(page).to have_css 'input[type="submit"]'
    end
    expect(page).to have_css 'a', text: 'Voltar'
  end

  it 'com sucesso' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Registrar Fornecedor'
    fill_in 'Nome', with: 'Organizações Tabajara'
    fill_in 'Razão Social', with: 'Organizações Tabajara SA'
    fill_in 'CNPJ', with: '1234567891234'
    fill_in 'Endereço', with: 'Rua do Bobos, 0'
    fill_in 'Email', with: 'org.tabajara@tabajara.com'
    fill_in 'Telefone', with: '(11) 9 1234-5678'
    click_on 'Criar Fornecedor'

    expect(current_path).to eq supplier_path(Supplier.first)
    expect(page).to have_css 'div', text: 'Fornecedor cadastrado com sucesso'
  end

  it 'com dados incompletos' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Registrar Fornecedor'
    fill_in 'Nome', with: ''
    fill_in 'Razão Social', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Email', with: ''
    click_on 'Criar Fornecedor'

    within('div ul') do
      expect(page).to have_css 'li', text: 'Nome não pode ficar em branco'
      expect(page).to have_css 'li', text: 'Razão Social não pode ficar em branco'
      expect(page).to have_css 'li', text: 'CNPJ não pode ficar em branco'
      expect(page).to have_css 'li', text: 'Email não pode ficar em branco'
      expect(page).to have_css 'li', text: 'CNPJ não possui o tamanho esperado (13 caracteres)'
      expect(page).to have_css 'li', text: 'Telefone não é válido'
    end
  end
end
# rubocop:enable Metrix/BlockLength
