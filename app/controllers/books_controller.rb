class BooksController < ApplicationController

  # GET: /books
  get "/books" do
    @books = current_user.books 
    erb :"/books/index"
  end

  # GET: /books/new
  get "/books/new" do
    erb :"/books/new"
  end


  # GET: /books/5
  get "/books/:id" do
    @book = Book.find(params["id"])
    erb :"/books/show"
  end

#CREATE a new book
  post '/books' do
    @book = Book.new(title: params["title"])
    #foreign key
    @book.save
    redirect '/books'
  end

  # UPDATE a book
  get "/books/:id/edit" do
    @book = Book.find(params["id"])
    erb :"/books/edit"
  end


  patch '/books/:id' do
    @book = Book.find_by_id(params[:id])
    @book.title = params[:title]
    @book.author = params[:author]
    @book.save
    redirect to "/books/#{@book.id}"
  end 

   
  put '/books/:id' do
    @book = Book.find(params["id"]) 
    @book.update(params["book"])
    redirect "/books/#{@book.id}"
  end
  
  delete "/books/:id" do
    @book = Book.find(params["id"])
    @book.destroy
    redirect "/books"
  end

  get "/users/:id" do # get info on idv. user
    if !logged_in?
      redirect "/login"
    end
    @user = User.find_by(params["user_id"]) 
    @books = Book.find_by(params["user_id"]) # added 
    erb :"/users/show"
  end
end
