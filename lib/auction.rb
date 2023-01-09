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
    attendees = []
    @items.each do |item|
      item.bids.each_key do |attendee|
        attendees << attendee
      end
    end
    attendees.compact.uniq
  end

  def bid_items_by_attendee(attendee)
    list_of_items = []
    @items.each do |item|
      item.bids.each_key do |bidder|
        list_of_items << item if attendee == bidder
      end
    end
    require 'pry'; binding.pry
    list_of_items
  end

  def bidder_info
    hash = Hash.new
    bidders.each do |bidder|
      hash[bidder] = {
        :budget => bidder.budget,
        :items => bid_items_by_attendee(bidder)
      }
    end
    hash
  end
end
