# This is where the magic happens

require 'pry'
require 'sinatra'
require 'httparty'
require 'nokogiri'


get '/' do
  @data = HTTParty.get("http://api.bart.gov/api/etd.aspx?cmd=etd&orig=ashb&key=ZSZR-595W-9QWT-DWE9&dir=s").parsed_response

  @apitime = @data['root']['time']
  @destination = @data['root']['station']['etd']['destination']
  @train1 = @data['root']['station']['etd']['estimate'][0]['minutes']
  @train2 = @data['root']['station']['etd']['estimate'][1]['minutes']
  @train3 = @data['root']['station']['etd']['estimate'][2]['minutes']





  erb :home

end
