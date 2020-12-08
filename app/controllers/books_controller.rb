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
    book.save
    redirect '/books'
  end

  # UPDATE a movie
  get "/books/:id/edit" do
    @book = Book.find(params["id"])
    erb :"/books/edit"
  end

   # UPDATE 1 movie based on the edit form 
   put '/bookss/:id' do
    @book = Book.find(params["id"]) 
    # @movie.update(title: params["movie"]["title"])
    @book.update(params["book"])
    redirect "/books/#{@book.id}"
end

  # PATCH: /books/5
  patch "/books/:id" do
    @movie = Movie.find{params["id"]}
    @book.update(params["book"])
    redirect "/books/:id"
  end

  # DELETE: /books/5/delete
  delete "/books/:id/delete" do
    redirect "/books"
  end
end
