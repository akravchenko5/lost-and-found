class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_rating = average_rating(@user)
  end

  private

  def average_rating(user)
    sum = 0.0

    @user.reviews_as_reviewed.each do |review|
      sum += review.rating
    end
    rating = (sum / @user.reviews_as_reviewed.count).to_f
    (rating * 2.0).round / 2.0
  end
end

