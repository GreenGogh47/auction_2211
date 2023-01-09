require './lib/item'
require './lib/attendee'

describe Attendee do
  before do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new(name: 'Megan', budget: '$50')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@attendee).to be_a(Attendee)
    end

    it 'has attributes' do
      expect(@attendee.name).to eq("Megan")
      expect(@attendee.budget).to eq(50)
    end
  end
end
