# frozen_string_literal: true

# Seeds static item price and calculates the price breakdown from the given items list

require_relative '../price_calculator_challange/seed'
require_relative '../price_calculator_challange/item'
require_relative '../price_calculator_challange/invoice'

Seed.seed_fixed_item_price
puts 'Please enter all the items purchased separated by a comma'
purchased_items = gets.chomp
invoice = Invoice.new
invoice.generate_invoice(purchased_items)
invoice.print_report