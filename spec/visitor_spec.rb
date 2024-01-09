require 'spec_helper'



RSpec.describe Visitor do
    before(:each) do
        @visitor1 = Visitor.new('Bruce', 54, '$10')
        @visitor2 = Visitor.new('Tucker', 36, '$5')
        @visitor3 = Visitor.new('Penny', 64, '$15')
    end

    it 'exists & has attributes' do
        expect(@visitor1).to be_an_instance_of(Visitor)
        expect(@visitor1.name).to eq("Bruce")
        expect(@visitor1.height).to eq(54)
        expect(@visitor1.spending_money).to eq("10")
     end

     it "has preferences" do
        expect(@visitor1.preferences).to eq([])
        expect(@visitor1.add_preference).to eq(:gentle)
        expect(@visitor1.add_preference).to eq(thrilling)
     end

     it "can check height" do
        expect(@visitor1.tall_enough?(54)).to eq true
        expect(@visitor2.tall_enough?(54)).to eq false
        expect(@visitor3.tall_enough?(54)).to eq true
        expect(@visitor1.tall_enough?(64)).to eq false
     end






end


 visitor1 = Visitor.new('Bruce', 54, '$10')
#=> #<Visitor:0x000000012f2b2818 @height=54, @name="Bruce", @preferences=[], @spending_money=10>

 visitor1.name
#=> "Bruce"

 visitor1.height
#=> 54

 visitor1.spending_money
#=> 10

 visitor1.preferences
#=> []

 visitor1.add_preference(:gentle)

 visitor1.add_preference(:thrilling)

 visitor1.preferences
#=> [:gentle, :thrilling]

 visitor2 = Visitor.new('Tucker', 36, '$5')
#=> #<Visitor:0x000000012f1f30f8 @height=36, @name="Tucker", @preferences=[], @spending_money=5>

 visitor3 = Visitor.new('Penny', 64, '$15')
#=> #<Visitor:0x000000012f176760 @height=64, @name="Penny", @preferences=[], @spending_money=15>

 visitor1.tall_enough?(54)
#=> true

 visitor2.tall_enough?(54)
#=> false

 visitor3.tall_enough?(54)
#=> true

 visitor1.tall_enough?(64)
#=> false
