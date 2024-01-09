require 'spec_helper'



RSpec.describe Ride do
    before(:each) do
        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
    end

    it 'exists & has attributes' do
        expect(@ride1).to be_an_instance_of(Ride)
        expect(@ride1.name).to eq("Carousel")
        expect(@ride1.admission_fee).to eq(1)
        expect(@ride1.excitement).to eq(:gentle)
        expect(@ride1.total_revenue).to eq(0)
    end

    it "can keep track of whos ridden" do
        @visitor1.add_preference(:gentle)
        @visitor2.add_preference(:gentle)
        @ride1.board_rider(visitor1)
        @ride1.board_rider(visitor2)
        @ride1.board_rider(visitor1)
        expect(@ride1.rider_log).to eqexpect(ride.rider_log).to eq({
            visitor1 => 2,
            visitor2 => 1
          })
    end

    it "can keep track of money spent" do
        expect(@visitor1.spending_money).to eq(10)
        expect(@visitor2.spending_money).to eq(5)

        @ride.board_rider(visitor1)
        @ride.board_rider(visitor2)
        @ride.board_rider(visitor1)

        expect(@visitor1.spending_money).to eq(8)
        expect(@visitor2.spending_money).to eq(4)
        expect(@ride1.total_revenue).to eq(3)
    end

    it "wont let riders get on if conditions arent met" do

        @visitor2.add_preference(:thrilling)
        @visitor3.add_preference(:thrilling)
        @ride3.board_rider(visitor1)
        @ride3.board_rider(visitor2)
        @ride3.board_rider(visitor3)

        expect(ride.board_rider(visitor1)).to true
        expect(ride.board_rider(visitor2)).to true
        expect(ride.board_rider(visitor3)).to false
  
        expect(visitor1.spending_money).to eq(8)
        expect(visitor2.spending_money).to eq(4)
        expect(visitor3.spending_money).to eq(13)
  
        expect(ride.rider_log).to eq({
          visitor1 => 1,
          visitor2 => 1
        })
    end
end
