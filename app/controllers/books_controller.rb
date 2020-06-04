class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
  end

  def new
  	@book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
    redirect_to books_path(@book.id)
  else
    render action: :index
  end
end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end