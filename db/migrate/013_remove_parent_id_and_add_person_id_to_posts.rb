# $Id$

class RemoveParentIdAndAddPersonIdToPosts < ActiveRecord::Migration
    def self.up
        remove_column :posts, :parent_id
        remove_column :post_versions, :parent_id
        add_column :posts, :person_id, :integer
        add_column :post_versions, :person_id, :integer
    end

    def self.down
        add_column :posts, :parent_id, :integer, :default => 0
        add_column :post_versions, :parent_id, :integer, :default => 0
        remove_column :posts, :person_id
        remove_column :post_versions, :person_id
    end
end