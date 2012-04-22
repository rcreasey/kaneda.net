# $Id$

class CreatePosts < ActiveRecord::Migration
    def self.up
        create_table :posts, :force => true do |t|
            t.column :parent_id, :integer, :default => 0
            t.column :title, :string
            t.column :contents, :string
            t.column :version, :integer
            t.column :created_on, :datetime
            t.column :updated_on, :datetime
        end
        
        Post.create_versioned_table
    end

    def self.down
        Post.drop_versioned_table
        
        drop_table :posts        
    end
end