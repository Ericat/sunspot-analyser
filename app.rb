require 'sinatra'
require 'haml'
require 'sass'
require './sungrid'
require 'json'

get '/' do
  @results = []
  haml :layout
end

post '/' do
  sungrid = SunGrid.new(params[:input])
  @results = sungrid.scores_to_colours
  @scores = @results.map {|x| x.map {|y| y[:score]}}.to_json
  haml :layout
end