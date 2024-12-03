advent_data_file = File.open("advent_data.txt")
advent_data = advent_data_file.map(&:chomp)
advent_data_file.close

sum = 0
enabled = true
advent_data.each do |memory_lane|
    muls = memory_lane.to_enum(:scan, /(do(n't)?\(\))|(mul\((\d{1,3}),(\d{1,3})\))/).map { Regexp.last_match }
    muls.each do |rmatch|
        p rmatch.captures
        if rmatch.captures[0] != nil then
            p "command"
            if rmatch.captures[1] != nil then
                p "argh"
                enabled = false
            else
                p "yeppers"
                enabled = true
            end
        end
        if enabled then
            p enabled
            sum += rmatch.captures[3].to_i * rmatch.captures[4].to_i
        end
    end
end

p sum