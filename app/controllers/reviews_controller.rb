class ReviewsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]
  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
  end
  def create
    @movie = Movie.find(params[:group_id])
    @review = review.new(review_params)
    @review.movie = @movie
    @review.user = current_user
    if @review.save
      redirect_to group_path(@movie)
    else
      render :new
    end
  end
  private
  def review_params
    params.require(:review).permit(:content)
  end
end
