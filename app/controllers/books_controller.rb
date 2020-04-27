class BooksController < ApplicationController
  before_filter :authorize
  helper_method :sort_column

  def index
    @book = Book.order(sort_column)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
      @book = Book.new(book_params.merge(user_id: current_user.id))

    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :genre, :country, :country_name, :editor, :year, :read, :borrowed, :borrowed_to, :rating, :user_id)
  end

  def sort_column  
    params[:sort] || "author"
  end
end
