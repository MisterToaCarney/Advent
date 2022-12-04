file = File.open("input.txt")
str = file.read
file.close

elves = str.split "\n\n"

largest_elf = 0
elves.each do |elf|
  total_calories = 0
  elf.split.each { |food_item_str| total_calories += food_item_str.to_i }
  if total_calories > largest_elf then largest_elf = total_calories end
end

puts "Largest elf has #{largest_elf} calories."
