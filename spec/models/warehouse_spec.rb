require 'rails_helper'

# rubocop:disable Metrix/BlockLength
RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false when name is empty' do
        # Arrange
        warehouse = Warehouse.new(name: '', code: 'GTR', address: 'Rua dos bobos, 0', cep: '10989-040',
                                  description: 'Warehouse from Neverland', area: 10_909, city: 'Neverland')

        # Act
        result = warehouse.valid?

        # Assert
        expect(result).to eq false
      end

      it 'false when code is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Neverland', code: '', address: 'Rua dos bobos, 0',
                                  cep: '10989-040', description: 'Warehouse from Neverland',
                                  area: 10_909, city: 'Neverland')

        # Act
        result = warehouse.valid?

        # Assert
        expect(result).to eq false
      end

      it 'false when address is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Neverland', code: 'GRM', address: '', cep: '10989-040',
                                  description: 'Warehouse from Neverland', area: 10_909,
                                  city: 'Neverland')

        # Act
        result = warehouse.valid?

        # Assert
        expect(result).to eq false
      end

      it 'false when CEP is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Neverland', code: 'RPM', address: 'Rua dos bobos, 0', cep: '',
                                  description: 'Warehouse from Neverland', area: 10_909, city: 'Neverland')

        # Act
        result = warehouse.valid?

        # Assert
        expect(result).to eq false
      end

      it 'false when description is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Neverland', code: 'RPM', address: 'Rua dos bobos, 0',
                                  cep: '12345-123', description: '', area: 10_909, city: 'Neverland')

        # Act
        result = warehouse.valid?

        # Assert
        expect(result).to eq false
      end

      it 'false when area is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Neverland', code: 'RPM', address: 'Rua dos bobos, 0',
                                  cep: '12asdf-123', description: 'Warehouse from Neverland',
                                  area: '', city: 'Neverland')

        # Act
        result = warehouse.valid?

        # Assert
        expect(result).to eq false
      end

      it 'false when city is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Neverland', code: 'RPM', address: 'Rua dos bobos, 0',
                                  cep: '12345-123', description: 'Warehouse from Neverland',
                                  area: 10_000, city: '')

        # Act
        result = warehouse.valid?

        # Assert
        expect(result).to eq false
      end
    end

    context 'data invalid' do
      it 'false when CEP is wrong' do
        # Arrange
        warehouse = Warehouse.new(name: 'Neverland', code: 'RPM', city: 'Neverland', area: 10_909,
                                  address: 'Rua dos bobos, 0', cep: '12asdf-123',
                                  description: 'Warehouse from Neverland')

        # Act
        result = warehouse.valid?

        # Assert
        expect(result).to eq false
      end

      it 'false when code is already in use' do
        # Arrange
        Warehouse.create(name: 'Neverland', code: 'CMD', address: 'Rua dos bobos, 0', cep: '01234-040',
                         description: 'Warehouse from Neverland', area: 10_909, city: 'Neverland')

        second_warehouse = Warehouse.new(name: 'Atlantis', code: 'CMD', address: 'Underwhater, 0',
                                         cep: '01234-040', description: 'Submerged Warehouse',
                                         area: 100_000, city: 'Antlantis')

        # Act
        result = second_warehouse.valid?

        # Assert
        expect(result).to eq false
      end

      it 'false when name is already in use' do
        Warehouse.create(name: 'Atlantis', code: 'CMD', address: 'Rua dos bobos, 0', cep: '01234-040',
                         description: 'Warehouse from Neverland', area: 10_909, city: 'Neverland')

        second_warehouse = Warehouse.new(name: 'Atlantis', code: 'ATL', address: 'Underwhater, 0',
                                         cep: '01234-040', description: 'Submerged Warehouse',
                                         area: 100_000, city: 'Antlantis')

        result = second_warehouse.valid?

        expect(result).to eq false
      end
    end
  end
end
# rubocop:enable Metrix/BlockLength
