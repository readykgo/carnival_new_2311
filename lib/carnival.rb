class Carnival
    attr_reader :duration, :rides
  
    def initialize(duration)
      @duration = duration
      @rides = []
    end
  
    def add_ride(ride)
      @rides << ride
    end
  
    def most_popular_ride
        return nil if @rides.empty? #doesnt apply to empty, did that throughout
    
        most_popular_ride = @rides.first
        most_rides_count = most_popular_ride.rider_log.values.sum #sets most count to the first so theres at least one, sets ride count to number recorded in log
    
        @rides.each do |ride| #iterates through ridesm marking the most popular one and updating that one as most popular before making next comparison
          rides_count = ride.rider_log.values.sum
          if rides_count > most_rides_count
            most_popular_ride = ride
            most_rides_count = rides_count
          end
        end
    end


        def most_profitable_ride
            return nil if @rides.empty?
        
            most_profitable_ride = @rides.first
            highest_revenue = most_profitable_ride.total_revenue #same process converted to revenue
        
            @rides.each do |ride|
              revenue = ride.total_revenue
              if revenue > highest_revenue
                most_profitable_ride = ride
                highest_revenue = revenue
              end
            end
        
            most_profitable_ride
          end
    def total_revenue
      @rides.sum { |ride| ride.total_revenue }
    end
 end