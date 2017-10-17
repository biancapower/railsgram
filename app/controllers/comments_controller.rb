class CommentsController < ApplicationController
  before_action :set_comment

  def index
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    redirect_to photos_path
  end

  private

    def set_comment
      @comment = Comment.find(params[:message])
    end

    def comment_params
      params.require(:comment).permit(:message)
    end
end
