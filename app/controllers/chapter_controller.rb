class ChapterController < ApplicationController
  def new
  	@book_chapter = Chapter.new
    @book_chapter.book_id = params[:book_id]
  end

  def create
  	@chapter = Chapter.new(chapter_params)
    @chapter.book_id = params[:book_id]
    if @chapter.save!
      redirect_to books_path.to_s + "/" + @chapter.book_id.to_s
    else
      render 'new'
    end
  end

  def show
  	@chapter = Chapter.find(params[:id])
  end

  def edit
  	@chapter = Chapter.find(params[:id])
  end

  def update
    @chapter = Chapter.find(params[:id])
    @chapter.update!(chapter_params)
    if @chapter.save!
      redirect_to book_chapter_path
    else
      render 'edit'
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(:name, :content)
  end
end