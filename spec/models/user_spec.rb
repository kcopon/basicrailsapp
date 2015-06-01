require 'rails_helper'

describe User do 

  include TestFactories

  before do
    @post = associated_post
    @user = authenticated_user
  end

  describe "#favorited(post)" do
    it "returns 'nil if the user has not favorited the post" do
    end

    it "returns the appropriate favorite if it exists" do
    end

    it "returns `nil` if the user has favorited another post" do
    end
  end
end


___

require 'rails_helper'

describe Comment do

 include TestFactories

 describe "after_create" do

   before do
     @post = associated_post
     @user = authenticated_user(email_favorites: true)
     @other_user = authenticated_user
     @comment = Comment.new(body: 'My comment is really great', post: @post, user: @other_user)
   end

   it "sends an email to users who have favorited the post" do
     favorite = @user.favorites.create(post: @post)

     allow( FavoriteMailer )
       .to receive(:new_comment)
       .with(@user, @post, @comment)
       .and_return( double(deliver_now: true) )

       expect( FavoriteMailer )
         .to receive(:new_comment)

     @comment.save
   end

   it "does not send emails to users who haven't" do
     expect( FavoriteMailer )
       .not_to receive(:new_comment)

     @comment.save
   end
 end
end