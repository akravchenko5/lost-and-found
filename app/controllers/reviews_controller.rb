class ReviewsController < ApplicationController
  def index
    #scope method?
  end

  def show
    @review = Review.find(params[:id])
    @reviewer = User.find(@review.reviewer_id)
    @reviewed = User.find(@review.reviewed_id)
  end

  def new
    @review = Review.new
    @user = User.find(params[:user_id])
  end

  def create
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @review.reviewed_id = @user.id
    @review.reviewer_id = current_user.id
    @review.save
     if @review.save
      flash[:notice] = "Added a new review!"
      redirect_to @review
    else render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def review_params
  params.require(:review).permit(:content, :rating)
  end

end
