require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'Usuário cadastra um galpão' do
  it 'a partir da tela inicial' do
    # Act
    visit root_path
    click_on 'Cadastrar Galpão'

    # Assert
    expect(current_path).to eq new_warehouse_path
    expect(page).to have_field 'Nome'
    expect(page).to have_field 'Descrição'
    expect(page).to have_field 'Código'
    expect(page).to have_field 'Endereço'
    expect(page).to have_field 'Cidade'
    expect(page).to have_field 'CEP'
    expect(page).to have_field 'Área'
  end

  it 'com sucesso' do
    # Act
    visit root_path
    click_on 'Cadastrar Galpão'
    fill_in 'Nome', with: 'Rio de Janeiro'
    fill_in 'Descrição',	with: 'Galpão da zona portuária do Rio'
    fill_in 'Código',	with: 'RIO'
    fill_in 'Endereço',	with: 'Avenida do Museu do Amanhã, 495'
    fill_in 'Cidade',	with: 'Rio de Janeiro'
    fill_in 'CEP',	with: '20100-100'
    fill_in 'Área',	with: '32000 m²'
    click_on 'Enviar'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Rio de Janeiro'
    expect(page).to have_content 'RIO'
  end

  it "mas não fornece os dados necessários" do
    
  end
  
end
# rubocop:enable Metrics/BlockLength