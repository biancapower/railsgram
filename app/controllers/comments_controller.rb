class CommentsController < ApplicationController
  before_action :set_comment

  def index
    @comment = Comment.new
  end

  # def create
  #   @photo = Photo.find(params[:photo_id])
  #   @comment = @photo.comments.create(comment_params)
  #   redirect_to photos_path
  # end

  def create
    @comment = @photo.comments

    @new_comment = Comment.new(comment_params)

    @new_comment.user = current_user

    @new_comment.photo = @photo

    @new_comment.save!

    redirect_to photos_path
  end

  def edit
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.find(params[:id])
  end

  def update

  end

  private

    def set_comment
      @comment = Comment.find(params[:message])
    end

    def comment_params
      params.require(:comment).permit(:message)
    end
end
