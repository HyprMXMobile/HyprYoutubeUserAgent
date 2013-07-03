require 'rubygems'
require 'plist'
require 'csv'


file = ARGV[0]

regex = /Mozilla\/5\.0.*AppleWebKit.*like Gecko.*Mobile.*Safari/
count = 0
matches = 0
devices = {}
regex_to_get_device = /Mozilla\/5.0 \((i\w*)\;/
regex_to_get_version = /CPU.*OS ([\d\_]*) like/

CSV.foreach(file) do |row|
  ua = row[0]
  count += 1
  if ua.match(regex)
    matches += 1
    device_type = ua.scan(regex_to_get_device)
    version = ua.scan(regex_to_get_version)
    devices[device_type] ||= {}
    devices[device_type][version] ||= ua
  end
end

puts "Count: #{count} Matches: #{matches}"
puts Plist::Emit.dump(devices)