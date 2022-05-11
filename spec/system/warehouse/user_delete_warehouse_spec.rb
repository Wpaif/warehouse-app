require 'rails_helper'

# rubocop:disable Metric/BlockLength
describe 'Usuário remove um galpão' do
  it 'com sucesso' do
    # Arrange
    Warehouse.create!(name: 'Galpão de Maceió', code: 'MCZ', city: 'Maceió', area: 50_000,
                      address: 'Avenida 1° de Maio', cep: '14331-115',
                      description: 'Orla de Maceió')

    # Act
    visit root_path
    click_on 'Galpão de Maceió'
    click_on 'Remover'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso'
    expect(page).not_to have_css 'h3', text: 'Galpão de Maceió'
  end

  it 'não apaga outros galpões' do
    # Arrange
    Warehouse.create!(name: 'Galpão de Maceió', code: 'MCZ', city: 'Maceió', area: 50_000,
                      address: 'Avenida 1° de Maio', cep: '14331-115',
                      description: 'Orla de Maceió')
    Warehouse.create!(name: 'Porto de Aracaju', code: 'ARC', city: 'Aracaju', area: 100_000,
                      address: 'Avenida 7° de Setembro', cep: '45252-245',
                      description: 'Galpão do porto de Aracaju')

    # Act
    visit root_path
    click_on 'Galpão de Maceió'
    click_on 'Remover'

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso' 
    expect(page).to have_css 'h3', text: 'Porto de Aracaju'
    expect(page).not_to have_css 'h3', text: 'Galpão de Maceió'
  end
end
# rubocop:enable Metric/BlockLength
