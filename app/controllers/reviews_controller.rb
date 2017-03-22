class ReviewsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]
  before_action :check_favorite, only: [:new, :create]

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie = @movie
    @review.user = current_user
    if @review.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  private

  def check_favorite
    @movie = Movie.find(params[:movie_id])
    if !current_user.is_member_of?(@movie)
      flash[:alert] = "你需要先收藏影片再评论！"
      redirect_to movie_path(@movie)
    end
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
