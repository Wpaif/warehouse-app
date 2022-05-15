require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'Usuário se eutentica' do
  it 'com sucesso' do
    # Arrange
    User.create!(email: 'wilian@email.com', password: 'password')

    # Act
    visit root_path
    click_on 'Entrar'

    within('form') do
      fill_in 'E-mail', with: 'wilian@email.com'
      fill_in 'Senha', with: 'password'
      click_on 'Entrar'
    end
    # Assert
    within('nav') do
      expect(page).not_to have_link 'Sair'
      expect(page).to have_content 'wilian@email.com'
    end

    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).not_to have_content 'Entrar'
    expect(page).to have_content 'wilian@email.com'
  end

  it 'e faz logout' do
    # Arrange
    User.create!(email: 'wilian@email.com', password: 'password')

    # Act
    visit root_path
    click_on 'Entrar'

    within('form') do
      fill_in 'E-mail', with: 'wilian@email.com'
      fill_in 'Senha', with: 'password'
      click_on 'Entrar'
    end
    click_on 'Sair'

    # Assert
    expect(page).to have_content 'Logout efetuado com sucesso.'
  end
end
# rubocop:enable Metrics/BlockLength
