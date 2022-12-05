file = File.open("input.txt")
lines = file.readlines
file.close

# Loop over each assignment pair and detect if they are overlapping
pairs_that_overlap = lines.map do |line|
    parsed_pair = line.match(/(\d+)-(\d+),(\d+)-(\d+)/)
    parsed_pair = parsed_pair[1..].each_slice(2)

    ranges = parsed_pair.map { |range| range[0].to_i..range[1].to_i }
    does_overlap = ranges[0].cover?(ranges[1]) || ranges[1].cover?(ranges[0])
end

answer = pairs_that_overlap.count(true)

puts "There are #{answer} assignment pairs that are fully overlapping"