require './lib/item'
require './lib/attendee'

describe Item do
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
      expect(@item1).to be_a(Item)
    end

    it 'has attributes' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
      expect(@item2.name).to eq('Bamboo Picture Frame')
    end

    it 'tracks bids' do
      expect(@item1.bids).to eq({})
    end
  end

  describe '#add_bid' do
    it 'adds a new bid to the hash of bids' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    end
  end
end
