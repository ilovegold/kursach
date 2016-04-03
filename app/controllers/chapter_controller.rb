class ChapterController < ApplicationController
  def new
  	@chapter = Chapter.new
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

  private

  def chapter_params
    params.require(:chapter).permit(:name, :content)
  end
end
