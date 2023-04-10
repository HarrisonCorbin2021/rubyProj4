
def dist2(p1, p2)
    sum_squares = 0
    p1.each_key do |k|
        puts "kv: #{k}"
        diff = p1|k| - p2|k|
end

def dist3(p1, p2)
    Math.sqrt(p1.keys.inject(0) { |sum_sq, k| sum_sq + (p1[k] - p2[k])**2})
end

def dist3b(p1, p2)
    ss = p1.keys.inject(0) do |sum_sq, k| 
        diff = p1[k] - p2[k]
        sum_sq + diff*diff
    end
    Math.sqrt(ss)
end


ans = dist({x: 4, y: 5}, {x: 1, y: 1})
puts "Dist is #{ans}"

puts dist2({x: 1, y: 2, z: 3, w: 4}, {x: 5, y: 6, z: 7, w: 8})
puts dist3({x: 1, y: 2, z: 3, w: 4}, {x: 5, y: 6, z: 7, w: 8})

p [1,2,5,2,5,,7,8,4,2,4,6,7,9,9,2,0,4].select { |i| i % 2 == 0}.length

def my_select(array)
    answer = []
    array.each do |i|
        answer << i if yield(i)
    end
    answer
end

p my_select[1,2,5,2,5,,7,8,4,2,4,6,7,9,9,2,0,4].select { |i| i % 2 == 0}