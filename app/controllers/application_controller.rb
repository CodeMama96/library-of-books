require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  use Rack::Flash
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'variousrandomletters'
  end

  get "/" do #get mthod with a '/' as an argument and it's being rendered to the welcome page
    erb :welcome
  end

  helpers do #helper methods that can be use anywhere within the application

    def logged_in?
        !!current_user
    end

    def current_user 
        @current_user ||=  User.find(session[:user_id]) if session[:user_id]
        #storing them inside the session, stored inside a cookie
    end
    
  end

end
