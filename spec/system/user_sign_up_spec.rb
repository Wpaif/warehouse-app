require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'Usuário de autentica' do
  it 'com sucesso' do
    # Arrange

    # Act
    visit root_path
    click_on 'Entrar'
    click_on 'Criar uma conta'

    within('form') do
      fill_in 'E-mail', with: 'wilian@email.com'
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      click_on 'Criar conta'
    end

    # Assert
    expect(page).to have_content 'Boas Vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'wilian@email.com'
    expect(page).to have_button 'Sair'
  end
end
# rubocop:enable Metrics/BlockLength

