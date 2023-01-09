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
    @bids.max do |bid|
      bid.last
    end.last
  end
end

