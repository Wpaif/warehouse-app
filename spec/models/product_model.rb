require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'invalid whe name is empty' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')
        wp = ProductModel.new(name: '', weight: 8000, width: 70, height: 50, depth: 10,
                              sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: Supplier.last)
        expect(wp.valid?).to eq false
      end

      it 'invalid whe weight is empty' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')
        wp = ProductModel.new(name: 'TV 32"', weight: '', width: 70, height: 50, depth: 10,
                              sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: Supplier.last)
        expect(wp.valid?).to eq false
      end

      it 'invalid whe width is empty' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')
        wp = ProductModel.new(name: 'TV 32"', weight: 8000, width: '', height: 50, depth: 10,
                              sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: Supplier.last)
        expect(wp.valid?).to eq false
      end

      it 'invalid whe height is empty' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')
        wp = ProductModel.new(name: 'TV 32"', weight: 8000, width: 70, height: '', depth: 10,
                              sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: Supplier.last)
        expect(wp.valid?).to eq false
      end

      it 'invalid whe depth is empty' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')
        wp = ProductModel.new(name: 'TV 32"', weight: 8000, width: 70, height: 50, depth: '',
                              sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: Supplier.last)
        expect(wp.valid?).to eq false
      end

      it 'invalid whe sku is empty' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')
        wp = ProductModel.new(name: 'TV 32"', weight: 8000, width: 70, height: 50, depth: 10,
                              sku: '', supplier: Supplier.last)
        expect(wp.valid?).to eq false
      end

      it 'invalid when supplier is empty' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

        wp = ProductModel.new(name: 'TV 32"', weight: 8000, width: 70, height: 50, depth: 10,
                              sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: nil)
        expect(wp.valid?).to eq false
      end
    end

    context 'format' do
      it 'invalid when sku is out of standard' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

        wp = ProductModel.new(name: 'TV 32"', weight: 8000, width: 70, height: 50, depth: 10,
                              sku: 'TV32-SAMSUAAAAAAAAAAAAAAAAA-XPTOFD-ASDFG', supplier: Supplier.last)
        expect(wp.valid?).to eq false
      end
    end

    context 'uniqueness' do
      it 'invalid when two sku are the same' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

        ProductModel.create(name: 'TV 32"', weight: 8000, width: 70, height: 50, depth: 10,
                            sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: Supplier.last)
        wp = ProductModel.new(name: 'TV 40"', weight: 10_000, width: 80, height: 56, depth: 7,
                              sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: Supplier.last)
        expect(wp.valid?).to eq false
      end
    end

    context 'numericality' do
      it 'invalid when weight is less than or equal to zero' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

        wp_one = ProductModel.new(name: 'TV 32"', weight: 0, width: 70, height: 50, depth: 10,
                                  sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: Supplier.last)
        wp_two = ProductModel.new(name: 'TV 40"', weight: -1, width: 80, height: 56, depth: 7,
                                  sku: 'TV40-SAMSU-XPTOFD-HJKLP', supplier: Supplier.last)

        result = wp_one.valid? && wp_two.valid?
        expect(result).to eq false
      end

      it 'invalid when width is less than or equal to zero' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

        wp_one = ProductModel.new(name: 'TV 32"', weight: 8000, width: 0, height: 50, depth: 10,
                                  sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: Supplier.last)
        wp_two = ProductModel.new(name: 'TV 40"', weight: 10_000, width: -1, height: 56, depth: 7,
                                  sku: 'TV40-SAMSU-XPTOFD-HJKLP', supplier: Supplier.last)

        result = wp_one.valid? && wp_two.valid?
        expect(result).to eq false
      end

      it 'invalid when height is less than or equal to zero' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

        wp_one = ProductModel.new(name: 'TV 32"', weight: 8000, width: 70, height: 0, depth: 10,
                                  sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: Supplier.last)
        wp_two = ProductModel.new(name: 'TV 40"', weight: 10_000, width: 80, height: -1, depth: 7,
                                  sku: 'TV40-SAMSU-XPTOFD-HJKLP', supplier: Supplier.last)

        result = wp_one.valid? && wp_two.valid?
        expect(result).to eq false
      end

      it 'invalid when depth is less than or equal to zero' do
        Supplier.create(brand_name: 'Organizações Tabajara', corporate_name: 'Organizações Tabajara SA',
                        registered_number: 2_342_435_654_123, full_address: 'Rua dos Bobos, 0',
                        email: 'org.tabajara@tabajara.com', phone_number: '(11) 9 1234-5678')

        wp_one = ProductModel.new(name: 'TV 32"', weight: 8000, width: 70, height: 50, depth: 0,
                                  sku: 'TV32-SAMSU-XPTOFD-ASDFG', supplier: Supplier.last)
        wp_two = ProductModel.new(name: 'TV 40"', weight: 10_000, width: 80, height: 56, depth: -1,
                                  sku: 'TV40-SAMSU-XPTOFD-HJKLP', supplier: Supplier.last)

        result = wp_one.valid? && wp_two.valid?
        expect(result).to eq false
      end
    end
  end
end
# rubocop:enale Metrics/BlockLength
