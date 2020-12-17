class BooksController < ApplicationController

  # GET: /books
  get "/books" do
    if logged_in?
      @books = Book.all
      erb :"/books/index"
    else
      redirect '/'
    end
  end

  # GET: /books/new
  get "/books/new" do
    if logged_in?
      erb :"/books/new"
    else
      redirect '/'
    end
  end

  # GET: /books/5
  get "/books/:id" do
    if logged_in?
      @book = Book.find_by_id(params["id"])
      erb :"/books/show"
    else 
      redirect '/'
    end
  end

    #CREATE a new book
  post '/books' do
    @book = Book.new(title: params["title"], author: params["author"], user_id: session[:user_id])
      if logged_in?
        if @book.save
          redirect "/books/#{@book.id}"
        else 
          redirect'/books/new'
        end
      else
        redirect '/'
      end
    end

  # UPDATE a book
  get "/books/:id/edit" do 
    @book = Book.find(params["id"])
      if protect?
        erb :"/books/edit"
      else
        flash[:message] = "You cannot edit this book!"
        redirect '/books'
      end
    end
   
  put '/books/:id' do
    @book = Book.find(params["id"]) 
    if protect? 
      @book.update(params["book"])
    end
      redirect "/books/#{@book.id}"
    end
  
  delete "/books/:id" do
    @book = Book.find(params["id"])
    if protect? 
      @book.destroy
    else
    flash[:message] = "You cannot delete this book!"
    end
    redirect "/books"
    end

end
