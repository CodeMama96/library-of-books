class BooksController < ApplicationController

  # GET: /books
  get "/books" do
    @books = Book.all
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
    book = Book.new(params)
    binding.pry
    book.save
    redirect '/books'
  end

  # UPDATE a book
  get "/books/:id/edit" do
    @book = Book.find(params["id"])
    erb :"/books/edit"
  end

  #POST
   # UPDATE 1 book based on the edit form 

   #POST 
  patch '/books/:id' do
    @book = Book.find_by_id(params[:id])
    @book.title = params[:title]
    @book.author = params[:author]
    @book.save
    redirect to "/books/#{@book.id}"
  end 

#   <form action="/books/<%= @book.id %>" method="post">
#   <input id="hidden" type="hidden" name="_method" value="patch">
#   <input type="text" name="title">
#   <input type="text" name="author">
#   <input type="submit" value="submit">
# </form> 
   
  put '/books/:id' do
    @book = Book.find(params["id"]) 
    @book.update(params["book"])
    redirect "/books/#{@book.id}"
  end
  
  delete "/books/:id/delete" do
    @book = Book.find(params["id"])
    @book.destroy
    redirect "/books"
  end

  #PATCH
end
