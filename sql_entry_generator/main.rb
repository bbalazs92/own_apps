Dir.mkdir('output') unless Dir.exist?('output')

$first_name_array = []
$last_name_array = []

File.open("files/first_names.txt").readlines.each do |line|
    $first_name_array << line.chomp
end

File.open("files/last_names.txt").readlines.each do |line|
    $last_name_array << line.chomp
end

def insert_random_detail(names)
    #randomly select a name from the array, capitalize if it's a last name
    names == "files/last_names.txt" ? random_text = $last_name_array.sample.capitalize : random_text = $first_name_array.sample
    #implicit return
    random_text
end

def generate_entries
    #starts with 1 because IDs supposed to start with 1
    i = 1
    entries = ""
    #adjust the number of entries by increasing loops
    #note to self: try yield
    while i < 1001 do
        new_entry = "INSERT INTO users (id, first_name, last_name, email, points_overall, validated) VALUES (#{i}, \"#{save_first_name = insert_random_detail("files/first_names.txt")}\", \"#{save_last_name = insert_random_detail("files/last_names.txt")}\", \"#{save_first_name + "." + save_last_name + "@fakemail.com"}\", #{rand(300)}, #{true});"
        entries.concat(new_entry).concat("\r\n")
    i += 1
    end
    entries
end

File.open('output/random_user_entries.txt', 'w') do |file|
    file.puts generate_entries
end