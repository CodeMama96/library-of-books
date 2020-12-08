require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'variousrandomletters'
  end

  get "/" do
    "Welcome!"
  end

  helpers do  #allows our views to access these methods 

  def logged_in?
      !!current_user
  end

  def current_user   #memoization
      @current_user ||=  User.find(session[:user_id]) if session[:user_id]
  #    if @current_user
  #      @current_user 
  #    else 
  #     @current_user =  User.find(session[:user_id])
  #    end
  end
end

end
