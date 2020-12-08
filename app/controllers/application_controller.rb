require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'variousrandomletters'
  end

  get "/" do
   # erb :welcome
   erb :"/users/index"
  end

  helpers do 

    def logged_in?
        !!current_user
    end

    def current_user 
        @current_user ||=  User.find(session[:user_id]) if session[:user_id]
    end
  end

  # post "/books/:id" do
  #    @book = Book.find(params["id"]) 
  #    #@book.update(params["book"])
  #   erb :"/books/show"
  # end
  # #why does error message want a post method here?

end
