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
end
