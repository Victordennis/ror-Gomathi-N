# frozen_string_literal: true

class Item
  attr_reader :name, :unit_price, :sale_price, :sale_units

  def initialize(name:, unit_price:, sale_price: nil, sale_units: nil)
    @name = name
    @unit_price = unit_price
    @sale_price = sale_price
    @sale_units = sale_units
  end

  # Returns all the objects of type Item
  def self.all
    ObjectSpace.each_object(self).group_by(&:name)
  end

  # Calculates actual price and profit per item based on the given quantity
  # Profit is calculated as below:
  # Total unit price of the quantity used for sale price - actual sale price
  def price_breakdown(item_quantity)
    if sale_price_applicable?(item_quantity)
      unit_price_quantity = quantity_for_unit_price(item_quantity)
      total_sale_price = quantity_for_sale_price(item_quantity) * sale_price
      { actual_price: (unit_price_quantity * unit_price + sale_price).round(2),
        profit: ((item_quantity - unit_price_quantity) * unit_price - total_sale_price).round(2) }
    else
      { actual_price: (quantity_for_unit_price(item_quantity) * unit_price).round(2), profit: 0 }
    end
  end

  def sale_price_applicable?(item_quantity)
    sale_price && item_quantity >= sale_units
  end

  # Considered the sale_units integer always
  def quantity_for_sale_price(item_quantity)
    (item_quantity / sale_units).to_i
  end

  def quantity_for_unit_price(item_quantity)
    sale_units ? item_quantity % sale_units : item_quantity
  end
end