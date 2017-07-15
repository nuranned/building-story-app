class StoriesController < ApplicationController
  before_action :require_login, only: :new

  def new
    @story = Story.new
    @photo = Photo.new
    @building = Building.find_by(params[:id])
  end

  def create
    @building = Building.find_by(params[:id])
    @story = Story.new(story_params)
    if @story.save
      redirect_to building_path(@building)
    end
  end

  def show

  end



  private

  def story_params
    params.require(:story).permit(:title, :description, :img, :user_id, :building_id)
  end

  def photo_params
    params.require(:photo).require(:img_file_name, :img_file_size, :img_content_type)
  end

end
