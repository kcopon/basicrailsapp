class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite
    
    if favorite.save
      flash[:notice] = "Post was favorited successfully"
      redirect_to [post.topic, post]
    else
      flash[:error] = "Error in favoriting post"
      redirect_to [post.topic, post]
    end
  end


  def destroy
    # Get the post from the params
    @post = Post.find(params[:post_id])
    # Find the current user's favorite with the ID in the params
    favorite = current_user.favorites.find(params[:id]) 
    authorize favorite

    if favorite.destroy
      flash[:notice] = "Post was succesfully un-favorited"
      redirect_to [@post.topic, @post] 
      # Flash success and redirect to @post
    else
      flash[:error] = "There was an error in un-favoriting this post"
      redirect_to [@post.topic, @post]
      # Flash error and redirect to @post
    end
  end
end


  

 