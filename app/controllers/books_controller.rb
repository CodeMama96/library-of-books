class BooksController < ApplicationController

  # GET: /books
  get "/books" do
    if logged_in?     
      @books = current_user.books
      erb :"/books/index"
      else 
        redirect '/'
    end
  end

  # GET: /books/new
  get "/books/new" do
    
    erb :"/books/new"
  end


  # GET: /books/5
  get "/books/:id" do
    @book = Book.find(params["id"])
    if logged_in?
      @books = current_user.books
      erb :"/books/show"
    else 
      redirect '/'
    end
  end

    #CREATE a new book
  post '/books' do
    @book = Book.new(title: params["title"], author: params["author"], user_id: session[:user_id])
      if @book.save
        redirect "/books/#{@book.id}"
      else 
        redirect'/books/new'
      end
    end

  # UPDATE a book
  get "/books/:id/edit" do
    @book = Book.find(params["id"])
      if @book.user.id == current_user.id
        erb :"/books/edit"
      else
        redirect '/'
      end
    end
   
  put '/books/:id' do
    @book = Book.find(params["id"]) 
    if @book.user.id == current_user.id 
      @book.update(params["book"])
  
    end
      redirect "/books/#{@book.id}"
    end
  
  delete "/books/:id" do
    @book = Book.find(params["id"])
    if @book.user.id == current_user.id 
      @book.destroy
    end
    redirect "/books"
    end

end
