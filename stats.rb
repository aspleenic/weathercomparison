require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra' 
require 'json'
require 'rest-client'

# require 'datamapper'

get '/' do
  erb :index
end

get '/amherst' do
  type = params[:type]
  logger.info(type)
  api_result = RestClient.get 'http://api.openweathermap.org/data/2.5/weather?id=5116303&units=imperial'
  jhash = JSON.parse(api_result)
  output = ''

  jhash['main'].each do |j|
    title = j[0]
    item = j[1]
    output << "<tr><td>#{title}</td><td>#{item}</td></tr>"
  end
  
  erb :index, :locals => {result: output}
end

get '/dublin' do
  type = params[:type]
  logger.info(type)
  api_result = RestClient.get 'http://api.openweathermap.org/data/2.5/weather?id=5344157&units=imperial'
  jhash = JSON.parse(api_result)
  output = ''

  jhash['main'].each do |j|
    title = j[0]
    item = j[1]
    output << "<tr><td>#{title}</td><td>#{item}</td></tr>"
  end
  
  erb :index, :locals => {result: output}
end

get '/stockholm' do
  type = params[:type]
  logger.info(type)
  api_result = RestClient.get 'http://api.openweathermap.org/data/2.5/weather?id=2673730&units=imperial'
  jhash = JSON.parse(api_result)
  output = ''

  jhash['main'].each do |j|
    title = j[0]
    item = j[1]
    output << "<tr><td>#{title}</td><td>#{item}</td></tr>"
  end
  
  erb :index, :locals => {result: output}
end


# Amherst, NY USA   5116303
# Dublin, Ireland   5344157
# Stockholm, Sweden 2673730