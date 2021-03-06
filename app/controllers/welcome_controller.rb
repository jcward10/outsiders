class WelcomeController < ApplicationController
  def index
    @profpic = current_user.photos.find_by(profile: true) if current_user
    @videos = Video.all
  end

  def deer
    @profpic = current_user.photos.find_by(profile: true) if current_user
    @videos = Video.where(huntType: "deer")
  end

  def duck
    @profpic = current_user.photos.find_by(profile: true) if current_user
    @videos = Video.where(huntType: "duck")
  end

  def like
    @video = Video.find(params[:vote])
    @video.liked_by(current_user)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end

  end

  def dislike
    @video = Video.find(params[:vote])
    @video.downvote_from(current_user)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
