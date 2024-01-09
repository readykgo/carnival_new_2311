class Visitor

    attr_reader :name, :height, :spending_money, :preferences

        def initialize(info)
          @name = info[:name]
          @height = info[:height]
          @spending_money = info[:spending_money].to_i# Convert to integer #need to make this array to keep track of changes
          @preferences = []
        end
      
        
      

    def add_preference(preference)
        @preferences << preference
    end

    def tall_enough?(needed_height)
        @height >= needed_height
    end
end

