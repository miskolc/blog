class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title
   
  validates :title, presence: true,uniqueness: true
  validates :name, presence: true
  validates :content, presence: true
end
