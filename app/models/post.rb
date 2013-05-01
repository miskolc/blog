class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title
   
  validates :title, presence: true,uniqueness: true, length: { minimum: 5, maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true

  default_scope order: "posts.created_at DESC"
 
end
