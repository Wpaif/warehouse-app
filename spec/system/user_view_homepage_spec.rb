require 'rails_helper'

# rubocop:disable Metrics/BlockLength
describe 'O usuario visita a tela inicial' do
  it 'e vê o nome do app' do
    # Act
    visit root_path

    # Assert
    expect(page).to have_content 'Galpões & Estoque'
  end

  it 'e vê os galpões cadastrados' do
    # Arrage
    Warehouse.create!(name: 'Rio', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                      address: 'Avenida Atlântica', cep: '04001-012',
                      description: 'Nas procimidades do aeroporto')
    Warehouse.create!(name: 'Maceió', code: 'MCZ', city: 'Maceió', area: 50_000,
                      address: 'Avenida 1° de Maio', cep: '14331-115',
                      description: 'Orla de Maceió')

    # Act
    visit root_path

    # Assert
    expect(page).not_to have_content 'Não existem galpões cadastrados'
    expect(page).to have_content 'Rio'
    expect(page).to have_content 'Código: SDU'
    expect(page).to have_content 'Cidade: Rio de Janeiro'
    expect(page).to have_content '60000 m²'

    expect(page).to have_content 'Maceió'
    expect(page).to have_content 'Código: MCZ'
    expect(page).to have_content 'Cidade: Maceió'
    expect(page).to have_content '50000 m²'
  end

  it 'e não tem galpões cadastrados' do
    # Act
    visit root_path
    # Assert
    expect(page).to have_content 'Não existem galpões cadastrados'
  end
end
# rubocop:enable Metrics/BlockLength
