# $Id$

class AddVersioningToComments < ActiveRecord::Migration
    def self.up
        add_column :comments, :version, :integer
        Comment.create_versioned_table
    end

    def self.down
        Comment.drop_versioned_table        
        drop_column :comments, :version
    end
end