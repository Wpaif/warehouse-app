require 'rails_helper'

# rubocop:disable Metrix/BlockLength
RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'invalid when brand name is empty' do
        supplier = Supplier.new(brand_name: '', corporate_name: 'Organizações Tabajara SA',
                                registered_number: 1_234_567_891_234, full_address: 'Rua do Bobos, 0',
                                email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

        expect(supplier.valid?).to eq false
      end

      it 'invalid when corporate name is empty' do
        supplier = Supplier.new(brand_name: 'Organizações Tabajara', corporate_name: '',
                                registered_number: 1_234_567_891_234, full_address: 'Rua do Bobos, 0',
                                email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

        expect(supplier.valid?).to eq false
      end

      it 'invalid when registered number is empty' do
        supplier = Supplier.new(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                                registered_number: '', full_address: 'Rua do Bobos, 0',
                                email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

        expect(supplier.valid?).to eq false
      end

      it 'invalid when email is empty' do
        supplier = Supplier.new(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                                registered_number: 1_234_567_891_234, full_address: 'Rua do Bobos, 0',
                                email: '', phone_number: '(11) 9 1234-5678')

        expect(supplier.valid?).to eq false
      end
    end

    context 'telephone in format' do
      it 'with expecial caracteres and/or spaces: (xx) x xxxx-xxxx' do
        supplier = Supplier.new(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                                registered_number: 1_234_567_891_234, full_address: 'Rua do Bobos, 0',
                                email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')
        expect(supplier.valid?).to eq true
      end

      it 'with only numbers' do
        supplier = Supplier.new(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                                registered_number: 1_234_567_891_234, full_address: 'Rua do Bobos, 0',
                                email: 'org.tabajara@tabajara.com', phone_number: '11912345678')
        expect(supplier.valid?).to eq true
      end
    end
  end
end
# rubocop:enale Metrix/BlockLength
