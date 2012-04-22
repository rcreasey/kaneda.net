# $Id$

class AddParentIdAndTypeToPosts < ActiveRecord::Migration
    def self.up
        add_column :posts, :parent_id, :integer, :default => 0
        add_column :post_versions, :parent_id, :integer, :default => 0
        add_column :posts, :type, :string
    end

    def self.down
        remove_column :posts, :type
        remove_column :posts, :parent_id
        remove_column :post_versions, :parent_id
    end
end