require 'uri'
require 'net/http'
require 'json'

n = ARGV[0].to_i

def getLiveStreamers(n)
    return JSON.parse(File.read("live_streamers.json"))[0...n]
  end
  
  live_streamers = getLiveStreamers(n)
  puts live_streamers

url = URI("https://lichess.org/streamer/live")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
request = Net::HTTP::Get.new(url)
response = http.request(request)

puts response.read_body