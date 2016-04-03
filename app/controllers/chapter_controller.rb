class ChapterController < ApplicationController
  def new
  	@book_chapter = Chapter.new
  end

  def create
  	@chapter = Chapter.new(chapter_params)

    #@book.user_id = current_user.id
    if @chapter.save!
      redirect_to @chapter
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