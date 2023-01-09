class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |item| item.name }
  end

  def unpopular_items
    unbidded = []
    @items.each do |item|
      if item.bids.empty?
        unbidded << item
      end
    end
    unbidded
  end

  def potential_revenue
    revenue = 0
    @items.each do |item|
      revenue += item.current_high_bid.to_i
    end
    revenue
  end

  def bidders
    bidders = []
    @items.each do |item|
      bidders << item.bids
    require 'pry'; binding.pry
    end
    bidders.uniq
  end
end
