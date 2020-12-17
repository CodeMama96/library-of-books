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

  get "/" do 
    erb :welcome
  end

  not_found do 
    status 400
    erb :error
  end

  helpers do 
    def logged_in?
        !!current_user
    end

    def current_user 
        @current_user ||=  User.find(session[:user_id]) if session[:user_id]
    end
    
    def user_delete?
      if @current_user ||=  User.find(session[:user_id]) if session[:user_id]
        binding.pry
      end
    end
  end

end
