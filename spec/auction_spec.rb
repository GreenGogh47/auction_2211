require './lib/item'
require './lib/auction'

describe Auction do
  before do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
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
end