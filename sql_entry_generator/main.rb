#create folder
#create file
#open file
#fill file with content
#close file
Dir.mkdir('output') unless Dir.exist?('output')

def output_method
    return 'smoke test'
end

File.open('output/random_user_entries.txt', 'w') do |file|
    file.puts output_method
end