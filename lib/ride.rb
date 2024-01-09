class Ride
    attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log
  
    def initialize(info)
      @name = info[:name]
      @min_height = info[:min_height]
      @admission_fee = info[:admission_fee].to_i
      @excitement = info[:excitement]
      @rider_log = {}
    end
   

\
def board_rider(visitor)
  return false unless rider_conditions_met?(visitor)
  
  minus_admission_fee(visitor)
  update_rider_log(visitor)
  true # added to ensure it returns true if conditions are met, protected with unless
end

      def total_revenue
        @rider_log.values.sum * @admission_fee.to_i
        #get the total amount of times ridden times the price
      end

      def rider_conditions_met?(visitor)
        height_condition = visitor.height >= @min_height
        preference_condition = visitor.preferences.empty? || visitor.preferences.include?(@excitement)
        spending_condition = visitor.spending_money >= @admission_fee.to_i
      
        height_condition && preference_condition && spending_condition
      end

      def minus_admission_fee(visitor)
        visitor.spending_money -= @admission_fee
      end
   

      def update_rider_log(visitor)
        @rider_log[visitor] = @rider_log.fetch(visitor, 0) + 1
        #check the log for visitor and increment by one.
      end
      
end