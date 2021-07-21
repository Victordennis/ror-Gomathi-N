# frozen_string_literal: true

class Invoice
  attr_accessor :total_price, :items_breakdown, :profit

  def initialize
    @total_price = 0
    @items_breakdown = []
    @profit = 0
  end

  def generate_invoice(purchased_items)
    all_items = Item.all
    items_quantity_per_category(purchased_items).each do |item, quantity|
      next unless all_items[item]  # Skip the inputs which is not a predefined item

      price = all_items[item][0].price_breakdown(quantity)
      items_breakdown << { name: item, quantity: quantity, price: price[:actual_price] }
      self.total_price += price[:actual_price]
      self.profit += price[:profit]
    end
  end

  def print_report
    puts "#{'Item'.ljust(10)} #{'Quantity'.ljust(10)} #{'Price'.ljust(10)}"
    puts '--------------------------------------'
    items_breakdown.each do |item|
      puts "#{item[:name].ljust(10)} #{item[:quantity].to_s.ljust(10)} $#{item[:price].to_s.ljust(10)}"
    end
    puts "Total price : $#{total_price.round(2)}"
    puts "You saved $#{profit.round(2)} today"
  end

  def items_quantity_per_category(purchased_items)
    items_counter = Hash.new(0)
    purchased_items.split(',').map { |item| items_counter[item.strip.capitalize] += 1 }
    items_counter
  end
end