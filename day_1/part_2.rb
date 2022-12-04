file = File.open("input.txt")
str = file.read
file.close

elves = str.split "\n\n"

calories_array = Array.new

elves.each do |elf|
    total_calories = 0
    elf.split.each { |food_item| total_calories += food_item.to_i }
    calories_array.push(total_calories)
end

output = calories_array.sort[-3..].sum

puts "The top three elves are carring #{output} calories in total"
