class PostPolicy < ApplicationPolicy
  class Scope
  def index?
    true
  end
end