class LinksController < ApplicationController
  def index
    @links = Link.all.order("votes desc")
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new params.require(:link).permit(:title, :url)

    if @link.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @link = Link.find params[:id]
  end

  def upvote
    @link = Link.find params[:id]
    @link.votes += 1
    @link.save
    redirect_to root_path
  end

  def downvote
    @link = Link.find params[:id]
    @link.votes -= 1
    @link.save
    redirect_to root_path
  end
end
