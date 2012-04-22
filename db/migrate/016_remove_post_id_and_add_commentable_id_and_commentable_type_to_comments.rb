# $Id$

class RemovePostIdAndAddCommentableIdAndCommentableTypeToComments < ActiveRecord::Migration
    def self.up
        remove_column :comments, :post_id
        add_column :comments, :commentable_id, :integer
        add_column :comments, :commentable_type, :string
    end

    def self.down
        add_column :comments, :post_id, :integer
        remove_column :comments, :commentable_id
        remove_column :comments, :commentable_type
    end
end