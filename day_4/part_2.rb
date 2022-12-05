file = File.open("input.txt")
lines = file.readlines
file.close

# Loop over each assignment pair and detect if they are loosely overlapping
pairs = lines.map do |line|
    parsed_line = line.match(/(\d+)-(\d+),(\d+)-(\d+)/)
    parsed_line = parsed_line[1..].each_slice(2)

    ranges = parsed_line.map { |range| range[0].to_i..range[1].to_i }
    does_overlap = ranges[0].end >= ranges[1].begin && ranges[0].begin <= ranges[1].end
end

answer = pairs.count(true)

puts "There are #{answer} assignment pairs that are loosely overlapping"