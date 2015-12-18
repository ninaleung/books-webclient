class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def new
    
  end

  def create
    @book = Book.create(
      title: params[:title],
      author: params[:author],
      publisher: params[:publisher],
      genre: params[:genre],
      year: params[:year]
      )
    redirect_to "/books/#{@book.id}"
  end

  def edit
    @book = Book.find_by(id: params[:id])

    # @book = Unirest.get("http://localhost:3000/books/#{params[:id]}.json").body
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.update(
      title: params[:title],
      author: params[:author],
      publisher: params[:publisher],
      genre: params[:genre],
      year: params[:year]
      )
    redirect_to "/books/#{@book.id}"
  end

  def destroy
    book = Book.find_by(id: params[:id])
    book.destroy
    redirect_to '/books'
  end
end
