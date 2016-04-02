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
    @book = Book.new(params[:book])    # Not the final implementation!
    if @book.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  def show
  	@book = Book.find(params[:id])
    @chapters = @book.chapters.paginate(page: params[:page], :per_page => 10)
  end

  def index
  	@books = Book.paginate(page: params[:page], :per_page => 10)
  end
end
