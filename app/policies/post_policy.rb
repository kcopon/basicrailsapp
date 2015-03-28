class PostPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :Scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def index
      @posts = Post.all?
        authorize @posts
      if user.admin? || moderator?
        scope.where(:id => record.id).exists?
      elsif policy()
        scope.where(:id => record.id).exists?
      else
        false
      end
    end
  end

  def index?
    true
  end
end