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
        expect(@ride1).to be_an_instance_of(Ride)
    end

    it "can keep track of whos ridden"
end


 ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
#=> #<Ride:0x000000015a136ab8 @admission_fee=1, @excitement=:gentle, @min_height=24, @name="Carousel", @rider_log={}>

 ride1.name
#=> "Carousel"

 ride1.min_height
#=> 24

 ride1.admission_fee
#=> 1

 ride1.excitement
#=> :gentle

 ride1.total_revenue
#=> 0

 visitor1 = Visitor.new('Bruce', 54, '$10')
#=> #<Visitor:0x000000015a16e918 @height=54, @name="Bruce", @preferences=[], @spending_money=10>

 visitor2 = Visitor.new('Tucker', 36, '$5')
#=> #<Visitor:0x000000015a11c5c8 @height=36, @name="Tucker", @preferences=[], @spending_money=5>

 visitor1.add_preference(:gentle)

 visitor2.add_preference(:gentle)

 ride1.board_rider(visitor1)

 ride1.board_rider(visitor2)

 ride1.board_rider(visitor1)

 ride1.rider_log
#=> {#<Visitor:0x000000015a16e918 @height=54, @name="Bruce", @preferences=[:gentle], @spending_money=8> => 2,
 #<Visitor:0x000000015a11c5c8 @height=36, @name="Tucker", @preferences=[:gentle], @spending_money=4> => 1}

 visitor1.spending_money
#=> 8

 visitor2.spending_money
#=> 4

 ride1.total_revenue
#=> 3

 visitor3 = Visitor.new('Penny', 64, '$15')
#=> #<Visitor:0x0000000159a852a0 @height=64, @name="Penny", @preferences=[], @spending_money=15>

 ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
#=> #<Ride:0x0000000159a0cd00 @admission_fee=5, @excitement=:gentle, @min_height=36, @name="Ferris Wheel", @rider_log={}>

 ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
#=> #<Ride:0x0000000159ae7a68 @admission_fee=2, @excitement=:thrilling, @min_height=54, @name="Roller Coaster", @rider_log={}>

 visitor2.add_preference(:thrilling)
#=> [:gentle, :thrilling]

 visitor3.add_preference(:thrilling)
#=> [:thrilling]

 ride3.board_rider(visitor1)

 ride3.board_rider(visitor2)

 ride3.board_rider(visitor3)

 visitor1.spending_money
#=> 8

 visitor2.spending_money
#=> 4

 visitor3.spending_money
#=> 13

 ride3.rider_log
#=> {#<Visitor:0x0000000159a852a0 @height=64, @name="Penny", @preferences=[:thrilling], @spending_money=13> => 1}

 ride3.total_revenue
#=> 2