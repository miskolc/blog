class AddIndexToPostsCreatedAt < ActiveRecord::Migration
  add_index :posts, [:created_at]
end
