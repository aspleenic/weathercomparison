require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra' 
require 'json'
require 'rest-client'

# require 'datamapper'

get '/' do
  
  type = params[:type]
  logger.info(type)
  api_result = RestClient.get 'http://api.wunderground.com/api/590adcdd681bf6e0/conditions/q/NY/Amherst.json'
  jhash = JSON.parse(api_result)
  counter = jhash['results'].count
  output = ''

  jhash['results'].each do |j|
    name = j['name']
    city = j['city']
    focus = j['who']
    count = j['members']
    contact = j['organizer_name']
    link = j['link']
    country = j['country']
    
    output << "<tr><td>#{name}</td> <td><a href = '#{link}' target = _new>#{city}</a></td><td>#{country.upcase}</td><td>#{focus}</td> <td>#{count}</td><td>#{contact}</td></tr>"
  end
  
  erb :index, :locals => {result: output, counter: counter}
end
