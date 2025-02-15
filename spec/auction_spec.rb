require './lib/item'
require './lib/attendee'
require './lib/auction'

describe Auction do
  before do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')

    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @attendee3 = Attendee.new(name: 'Mike', budget: '$100')

    @auction = Auction.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@auction).to be_a(Auction)
    end
    
    it 'has attributes' do
      expect(@auction.items).to eq([])
    end
  end

  describe '#add_item' do
    it "can add items to the array of items" do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end
  end

  describe '#item_names' do
    it 'displays the array of items names' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end

  describe '#unpopular_items' do
    it 'array of items that have no bids' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)

      expect(@auction.unpopular_items).to match_array([@item2, @item3, @item5])

      @item3.add_bid(@attendee2, 15)

      expect(@auction.unpopular_items).to match_array([@item2, @item5])
    end
  end

  describe '#potential_revenue' do
    it 'totals all of the highest bids' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.potential_revenue).to eq(87)
    end
  end

  describe '#bidders' do
    it 'returns an array of all bidders in the auction' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      # require 'pry'; binding.pry

      expect(@auction.bidders).to match_array([@attendee2, @attendee1, @attendee3])
    end
  end

  describe '#bidder_info' do
    it 'returns a hash with KEYS that are attendees, and VALUES that are a
    hash with their budget, and an array of items they bid on' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expected = {
        @attendee1 => {
          :budget => 50,
          :items => [@item1]
        },
        @attendee2 => {
          :budget => 75,
          :items => [@item1, @item3]
        },
        @attendee3 => {
          :budget => 100,
          :items => [@item4]
        }
      }

      expect(@auction.bidder_info).to include?(expected)
    end
  end
end