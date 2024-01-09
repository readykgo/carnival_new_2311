require 'spec_helper'
RSpec.describe Carnival do
    before(:each) do
      @carnival = Carnival.new(14) # 14 days duration
      @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
      @visitor1 = Visitor.new({ name: 'Bruce', height: 54, spending_money: 10 })
      @visitor2 = Visitor.new({ name: 'Tucker', height: 36, spending_money: 5 })
    end
  
    it 'has a duration' do
      expect(@carnival.duration).to eq(14)
    end
  
    it 'can add rides and list them' do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)
  
      expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
    end
  
    it 'can tell the most popular ride' do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      @ride2.board_rider(@visitor1)
  
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
  
      expect(@carnival.most_popular_ride).to eq(@ride1)
    end
  
    it 'can tell the most profitable ride' do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      @ride2.board_rider(@visitor1)
  
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
  
      expect(@carnival.most_profitable_ride).to eq(@ride1)
    end
  
    it 'can calculate the total revenue' do
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride2.board_rider(@visitor1)
  
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
  
      expect(@carnival.total_revenue).to eq(6) # 2 rides * $3 total revenue
    end
  end