class ReviewsController < ApplicationController
 before_filter :ensure_logged_in, only: [:create, :destroy]
 before_filter :load_parent

 def show
   @review = Review.find(params[:id])
 end

 def create
   @review = @restaurant.reviews.build(review_params)
   @review.user = current_user

   if @review.save
     redirect_to restaurants_path, notice: 'Review created successfully'
   else
     render 'restaurant_path(@restaurant)'
   end
 end

 def destroy
   @review = Review.find(params[:id])
   @review.destroy
 end

 def edit
   @review = Review.find(params[:id])
 end

 def update
   @review = Review.find(params[:id])
       if @review.update_attributes(review_params)
         redirect_to restaurants_path
       else
         #when we add ui then put in flash notice
         render 'edit'
       end

   end

 private

   def review_params
     params.require(:review).permit(:comment, :restaurant_id)
   end

   def load_parent
     @restaurant = Restaurant.find(params[:restaurant_id])
   end
end
