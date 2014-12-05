#Downloads all of the images from a provided url address
require 'nokogiri'
require 'open-uri'

print "Url to retrieve from: "
url = gets.chomp

Nokogiri::HTML(open(url)).xpath("//img/@src").each do |src|
	uri = URI.join( url, src ).to_s #make absolute uri
	File.open(File.basename(uri), 'wb'){ |f| f.write(open(uri).read) }
end