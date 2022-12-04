def calculate_points(round)
  points = 0
  
  # Points for specific moves
  case round[1]
  when "X" then points += 1
  when "Y" then points += 2
  when "Z" then points += 3
  end 
  
  # Draws
  if round[0] == "A" && round[1] == "X" then points += 3
  elsif round[0] == "B" && round[1] == "Y" then points += 3
  elsif round[0] == "C" && round[1] == "Z" then points += 3
    
  # Winnings
  elsif round[0] == "A" && round[1] == "Y" then points += 6
  elsif round[0] == "B" && round[1] == "Z" then points += 6
  elsif round[0] == "C" && round[1] == "X" then points += 6 
  end
  
  return points
end

file = File.open("input.txt")
lines = file.readlines
file.close

all_points = lines.map do |line|
  round = line.split(" ")
  calculate_points(round)
end

output = all_points.sum

puts "My total score is #{output} points"