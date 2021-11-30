Dir.mkdir('output') unless Dir.exist?('output')

def insert_random_detail(filename)
    if filename == "email"
        random_text = insert_random_detail("files/first_names.txt") + "." + insert_random_detail("files/last_names.txt") + "@" + "fakemail.com"
        return random_text
    end
    word_array = []
    #open file, load it's contents into an array
    File.open(filename).readlines.each do |line|
        word_array << line.chomp
    end
    #filter names that are either too short or too long
    word_array.select! { |string| string.length > 1 and string.length < 9}
    #randomly select a name from the array, capitalize if it's a last name
    filename == "files/last_names.txt" ? random_text = word_array.sample.capitalize : random_text = word_array.sample
    #implicit return
    random_text
end

def generate_entries
    #starts with 1 because IDs supposed to start with 1
    i = 1
    entries = ""
    #adjust the number of entries by increasing loops
    #note to self: try yield
    while i < 101 do
        new_entry = "INSERT INTO users (id, first_name, last_name, email, points_overall, validated) VALUES (#{i}, \"#{save_first_name = insert_random_detail("files/first_names.txt")}\", \"#{save_last_name = insert_random_detail("files/last_names.txt")}\", \"#{save_first_name + "." + save_last_name + "@fakemail.com"}\", #{rand(300)}, #{true});"
        entries.concat(new_entry).concat("\r\n")
    i += 1
    end
    entries
end

File.open('output/random_user_entries.txt', 'w') do |file|
    file.puts generate_entries
end