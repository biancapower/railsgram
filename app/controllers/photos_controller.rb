class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy, :like, :dislike]

# Photo.where(user: user.followers)



  def index
    # if the url is /photos?following
    if params.has_key?(:following)

      # @user = User.find(params[:id])

      # @photos = Photo.where(user: @user.followers)



# =begin
      # create an array to hold the photos we want to show (i.e those from users the current user is following)
      @photos = []

      # for each user that the current user is following, add the array of their photos to "@photos"
      current_user.following.each do |followee|
        @photos << followee.photos
      end
      # flatten "@photos" to be a one-dimensional array of all photos from all users followed by current user
      @photos.flatten!
# =end

    # if the url is /photos, show all photos from all users
    else
      @photos = Photo.all
      @comment = Comment.new
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    if @photo.user == current_user
      respond_to do |format|
        if @photo.update(photo_params)
          format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
          format.json { render :show, status: :ok, location: @photo }
        else
          format.html { render :edit }
          format.json { render json: @photo.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    if @photo.user == current_user
      @photo.destroy
      respond_to do |format|
        format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def like
    if current_user.liked?(@photo)
      @photo.unvote_by current_user
    else
      @photo.liked_by current_user
    end

    redirect_to photos_path
  end

  def dislike
    if current_user.disliked?(@photo)
      @photo.unvote_by current_user
    else
      @photo.disliked_by current_user
    end

    redirect_to photos_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through. PHOTOS
    def photo_params
      params.require(:photo).permit(:caption, :image, :following)
    end
end
