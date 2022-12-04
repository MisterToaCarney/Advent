file = File.open("input.txt")
lines = file.readlines
file.close

def calculate_points(round)
  move_points = {
    "A" => 1,
    "B" => 2,
    "C" => 3
  }
  
  winning_moves = {
    "A" => "B",
    "B" => "C",
    "C" => "A"
  }
  
  losing_moves = winning_moves.invert
  
  round_points = 0
  
  case round[1]
  when "X" 
    my_move = losing_moves[round[0]]
    round_points += 0
  when "Y"
    my_move = round[0]
    round_points += 3
  when "Z"
    my_move = winning_moves[round[0]]
    round_points += 6
  end
  
  round_points += move_points[my_move]
end

all_points = lines.map do |line|
  round = line.split(" ")
  calculate_points(round)
end

output = all_points.sum

puts "Total score is #{output} points"