class Visitor

    attr_reader :name, :height, :spending_money, :preferences

    def initialize(info)
        @name = info[:name]
        @height = info[:height]
        @spending_money = info[spending_money]
        @preferences = []
    end

        def add_preference(info)
            @preferences << info
        end

        def tall_enough?
            @height == 
