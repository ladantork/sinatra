require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # GET/
  # Root path (homepage, index page)

  get '/' do
     return "Hello!"
  end

  get '/posts' do
    return "A list of posts"
 end

 post '/posts' do
    return " Post was created"
 end

 get '/hello' do 
   name = params[:name]
   return "Hello #{name}"
 end

 post '/submit' do
    name = params[:name]
    message = params[:message]
    return "Thanks #{name}, you sent this message: '#{message}'"
 end

end

# Incoming request: GET/todos/1
# Routes: 

# GET/ -> execute some code
# GET/todos/1
# POST/todos

