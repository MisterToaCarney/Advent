# Load the input
file = File.open("input.txt")
lines = file.readlines
file.close

# Split each bag into 2 equal sized compartments
bags = lines.map do |line|
    line = line.strip
    compartment_size = line.length / 2
    [line[...compartment_size], line[compartment_size...]]
end

# Create a hash mapping each character to a priority value
priorities = *1..52
items = [*"a".."z", *"A".."Z"]
item_to_priorities = items.zip(priorities).to_h

# For each bag, find the common item and get its priority
priority_each_bag = bags.map do |bag|
    common_item = bag[0].each_char.find { |char| bag[1].include?(char) }
    priority = item_to_priorities[common_item]
end

# Sum the priorities to get answer
answer = priority_each_bag.sum

puts "The sum of priorities for each common item is #{answer}"