class BooksController < ApplicationController
  before_action :user_signed_in?, only: [:show]

  def new
    if user_signed_in?
      @book = Book.new
    else
      redirect_to login_path
    end
  end

  def create
    @book = Book.new(book_params)    # Not the final implementation!
    @book.user_id = current_user.id
    if @book.save!
      redirect_to @book
    else
      render 'new'
    end
  end

  def show
  	@book = Book.find(params[:id])
    @chapters = @book.chapters.paginate(page: params[:page], :per_page => 10)
    @comments = @book.comments.paginate(page: params[:page], :per_page => 50)
    @comment = Comment.new
  end

  def index
  	@books = Book.paginate(page: params[:page], :per_page => 10)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    

  end

  private

  def book_params
    params.require(:book).permit(:name, :genre)
  end
end
