class Stats
    attr_reader :values, :sum

    def initialize
        @values = []
        @sum = 0
        @sum_sq = 0
    end

    puts "#{x} plus #{y} is #{x + y}"
    name = "bob"
    puts "Hi, #{name.capitalize}"

    puts 'Single quotes are not interpolated #{x}'

    # build distribution (:gauss)

    my dog = {
        name: 'fido',
        age: 17
    }

    other_dog = {
        :name => 'fido',
        :age => 19
    }

    puts "My dog is #{my_dog[:name]}. He is #{my_dog[:age]} years old"

    months = {}
    months[:january] = 31
    months[:febuary] = 29

    #Constructor is named initialize
    def initialize
        @values = []
        @sum = 0
        @sum_sq = 0
    end

    def add(value)
            @values << value
            @sum += value
            @sum_sq += value * value
    end

    def mean
        @sum.to_f / @values.count
    end

    #def median 
    #   if(@values.count % 2 == 0)
    #      (@values[mid])
    #end

    #self?
    s1.add(5)
    puts "Mean is #{s1.mean}. Median: #{s1.median}"

    puts "Current sum is #{s1.add(5)}"
end
