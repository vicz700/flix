class ReviewsController < ApplicationController
  before_action :set_movie

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to movie_reviews_path(@movie), notice: "Review successfully updated!"
    else
      render "edit"
    end
  end

  def create
    @review = @movie.reviews.new(review_params)
    if @review.save
      redirect_to movie_reviews_path(@movie), notice: "Thanks for your review!"
    else
      render "new"
    end

  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @movie.reviews.destroy(@review)
    redirect_to movie_reviews_path(@movie), alert: "Review successfully deleted!"
  end

  private

  def review_params
    params.require(:review).permit(:name, :stars, :rating, :comment)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end


end


