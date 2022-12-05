# Load the input
file = File.open("input.txt")
lines = file.readlines
file.close

# Group every three bags
groups = lines.each_slice(3).to_a

# Create a hash mapping each character to a priority value
priorities = 1..52
items = [*"a".."z", *"A".."Z"]
item_to_priorities = items.zip(priorities).to_h

# Find the common item in each group and get its priority
priority_each_group = groups.map do |group|
    badge = group[0].each_char.find { |char| group[1].include?(char) && group[2].include?(char) }
    priority = item_to_priorities[badge]
end

# Sum the priorities to get answer
answer = priority_each_group.sum

puts "Sum of the priorities of badges for each group is #{answer}"