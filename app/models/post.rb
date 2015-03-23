class Post < ActiveRecord::Base
  has_many :comments
  scope :ordered_by_title, -> (title) 
  scope :ordered_by_reverse_created_at -> (time) { where(created_at, time)}.reverse!
end
git 