class UsersController < ApplicationController
  before_action :set_user, only: [:follow]

  def follow
    if @user.followed_by?(current_user)
      @user.followers.delete(current_user)
    else
      @user.followers << current_user
    end

    redirect_to '/photos'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_id)
    end
end
