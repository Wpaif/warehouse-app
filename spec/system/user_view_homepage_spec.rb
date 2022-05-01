require 'rails_helper'

describe "O usuario visita a tela inicial" do
  it "e vê o nome do app" do
    # Arrange

    # Act 
    visit '/'
    # Assert
    expect(page).to have_content('Galpões & Estoque')
  end
end

