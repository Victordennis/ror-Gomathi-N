# frozen_string_literal: true

class Seed
  def self.seed_fixed_item_price
    [{ name: 'Milk', unit_price: 3.97, sale_price: 5.00, sale_units: 2 }, { name: 'Bread', unit_price: 2.17, sale_price: 6.00, sale_units: 3 },
     { name: 'Banana', unit_price: 0.99 }, { name: 'Apple', unit_price: 0.89 }].each do |item_attributes|
      Item.new(item_attributes)
    end
  end
end