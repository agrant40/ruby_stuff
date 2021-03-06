#Converts a csv file to xml
require 'csv'

input_file = ARGV.pop

if ARGV.empty?
	print "CSV field to read: "
	input_file = gets.chomp
end

print "File to write XML to: "
output_file = gets.chomp

print "What to call each record: "
record_name = gets.chomp

csv = CSV::parse(File.open(input_file) {|f| f.read} )
fields = csv.shift

puts "Writing XML..."

File.open(output_file, 'w') do |f|
	f.puts '<?xml version="1.0"?>'
	f.puts '<records>'
	csv.each do |record|
		f.puts " <#{record_name}>"
		for i in 0..(fields.length - 1)
			f.puts "  <#{fields[i]}>#{record[i]}</#{fields[i]}>"
		end

		f.puts " </#{record_name}>"
	end
	f.puts '</records>'
end

puts "Contents of #{input_file} written as XML to #{output_file}."