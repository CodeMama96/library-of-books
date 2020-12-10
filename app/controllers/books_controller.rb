class BooksController < ApplicationController

  # GET: /books
  get "/books" do
    #@books = Book.all
    # erb :"/books/index"
    if logged_in?
      @current_user_books = current_user.books.all
      erb :"/books/index"
      else 
        erb :welcome

        #Added if logged_in?, hasn't done anything yet...
    end
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
    @book = Book.new(title: params["title"], author: params["author"])
    #foreign key
    if @book.save
      redirect "/recipes/#{@book.id}"
    else 
      redirect'/books/new'
    end
    #changed this to an if statement as well, nothing has happened yet, check if any future errors come
  end

  # UPDATE a book
  get "/books/:id/edit" do
    @book = Book.find(params["id"])
    erb :"/books/edit"
  end


  patch '/books/:id' do
    # @book = Book.find_by_id(params[:id])
    # @book.title = params[:title]
    # @book.author = params[:author]
    # @book.save
    # redirect to "/books/#{@book.id}"

    @book = book.find_by_id(params[:id])
    params.delete("_method")
    if @book.user.id == current_user.id && @book.update(title: params[:title], author: params[:author], user_id: current_user.id)
      redirect "/books/#{@book.id}"
    else
      redirect "/books/#{@book.id}/edit"
    end

  end 


### Still confused about this patch method
   
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

  get "/users/:id" do # get info on each user
    if !logged_in?
      redirect "/login"
    end
    @user = User.find_by(params["user_id"]) 
    @books = Book.find_by(params["user_id"]) # added 
    erb :"/users/show"
  end
end
