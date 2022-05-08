require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'Usuário edita um galpão' do
  it 'a partir da tela de detalhes' do
    # Arrange
    warehouse = Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado a cargas internacionais')
    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'

    # Assert
    expect(current_path).to eq edit_warehouse_path(Warehouse.first.id)
    expect(page).to have_content 'Editar Galpão'
    expect(page).to have_field 'Nome', type: 'text', with: warehouse.name
    expect(page).to have_field 'Código', type: 'text', with: warehouse.code
    expect(page).to have_field 'Cidade', type: 'text', with: warehouse.city
    expect(page).to have_field 'Área', type: 'number', with: warehouse.area
    expect(page).to have_field 'Endereço', type: 'text', with: warehouse.address
    expect(page).to have_field 'CEP', type: 'text', with: warehouse.cep
    expect(page).to have_field 'Descrição', type: 'textarea', with: warehouse.description
    expect(page).to have_link 'Voltar'
    expect(page).to have_css 'input[@type="submit"]'
  end

  it 'com sucesso' do
    # Arrange
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado às cargas internacionais')

    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'

    fill_in 'Nome',	with: 'Aeroporto do Galeão'
    fill_in 'Código',	with: 'GIG'
    fill_in 'Cidade',	with: 'Rio de Janeiro'
    fill_in 'Área',	with: '200000'
    fill_in 'Endereço', with: 'Avenida Vinte de Janeiro, s/n°'
    fill_in 'CEP',	with: '21941-900'
    fill_in 'Descrição', with: 'Galpão do Aeroporto internacional Antônio Carlos Jobim'
    click_on 'Atualizar Galpão'

    # Assert
    expect(page).to have_content 'Galpão atualizado com sucesso'
    expect(page).to have_css 'h2', text: 'Galpão GIG'
    expect(page).to have_content 'Nome: Aeroporto do Galeão'
    expect(page).to have_content 'Cidade: Rio de Janeiro'
    expect(page).to have_content 'Área: 200000m²'
    expect(page).to have_content 'Endereço: Avenida Vinte de Janeiro, s/n° CEP: 21941-900'
    expect(page).to have_css 'p', text: 'Galpão do Aeroporto internacional Antônio Carlos Jobim'
  end

  it 'e mantem os campos obrigatórios' do
    # Arrange
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                      description: 'Galpão destinado às cargas internacionais')

    # Act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'

    fill_in 'Nome',	with: ''
    fill_in 'Código',	with: ''
    fill_in 'Cidade',	with: ''
    fill_in 'Área',	with: ''
    fill_in 'Endereço', with: ''
    fill_in 'CEP',	with: ''
    fill_in 'Descrição', with: ''
    click_on 'Atualizar Galpão'

    # Assert
    expect(page).to have_content 'Não foi possivel atualizar o galpão'
  end
end
# rubocop:enable Metrics/BlockLength
