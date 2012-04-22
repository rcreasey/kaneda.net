# $Id$

class RemoveParentIdAndPersonIdFromTags < ActiveRecord::Migration
    def self.up
        remove_column :tags, :person_id
        remove_column :tags, :parent_id
    end

    def self.down
        add_column :tags, :person_id, :integer
        add_column :tags, :parent_id, :integer
    end
end