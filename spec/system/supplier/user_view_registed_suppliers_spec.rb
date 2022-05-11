require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'Usuário ver' do
  it 'os fornecedores cadastrados' do
    Supplier.create!(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                     registered_number: 1_234_567_891_234, full_address: 'Rua dos Bobos, 0',
                     email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

    visit root_path
    click_on 'Fornecedores'

    expect(current_path).to eq suppliers_path
    expect(page).to have_css 'h2', text: 'Fornecedores'
    expect(page).not_to have_css 'p', text: 'Não há Fornecedores cadastrados'
    within('table') do
      within('thead tr') do
        expect(page).to have_css 'th', text: 'Nome'
        expect(page).to have_css 'th', text: 'Razão Social'
        expect(page).to have_css 'th', text: 'CNPJ'
        expect(page).to have_css 'th', text: 'Endereço'
        expect(page).to have_css 'th', text: 'Email'
        expect(page).to have_css 'th', text: 'Telefone'
      end

      within('tbody tr') do
        expect(page).to have_css 'td', text: 'Organizações Tabajara'
        expect(page).to have_css 'td', text: 'Organizações Tabajara SA'
        expect(page).to have_css 'td', text: '1234567891234'
        expect(page).to have_css 'td', text: 'Rua dos Bobos, 0'
        expect(page).to have_css 'td', text: 'org.tabajara@tabajara.com'
        expect(page).to have_css 'td', text: '(11) 9 1234-5678'
      end
    end
  end

  it 'ver que não há fornecedores cadastrados' do
    visit root_path
    click_on 'Fornecedores'

    expect(current_path).to eq suppliers_path
    expect(page).to have_css 'p', text: 'Não há fornecedores cadastrados'
  end
end
# rubocop:enable Metrics/BlockLength