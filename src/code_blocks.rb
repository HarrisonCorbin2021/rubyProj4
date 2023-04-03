def traditional_selection_sort(values)
    for i in 0..(values.count - 1)
        min_loc = 1
        for j in (i + 1)..(values.count - 1)
            min_loc = j if yield(values[j], values[min_loc])
        end
    temp = values[i]
    values[i] = values[min_loc]
    values[min_loc] = temp
    end
    values
end

def rectangle(width, height)
        (1..height).each do |i|
            puts "*" * width
     end
end

puts rectangle(p1, p2)

#low to high
p traditional_selection_sort([8,6,7,5,3,0,9]) {|a,b| a > b}
#high to low
p traditional_selection_sort([8,6,7,5,3,0,9]) {|a,b| a < b}


p traditional_selection_sort([dog1,dog2,dog3]) {|a,b| a[:age] > b[:age]}

array = [8,6,7,5,3,0,9]
sum = 0
array.each {|i| sum += 1}

array.each_with_index

array = [1,2,3,4,5,67,7]
squared = array.map[i * i]
p squared