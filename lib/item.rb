class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, cash)
    @bids[attendee] = cash
  end

  def current_high_bid
    high_bids = []
    @bids.each do |attendee,bid|
      high_bids << bid
    end
    high_bids.max
  end
end

