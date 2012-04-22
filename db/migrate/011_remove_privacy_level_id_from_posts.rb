# $Id$

class RemovePrivacyLevelIdFromPosts < ActiveRecord::Migration
    def self.up
        remove_column :posts, :privacy_level_id
    end

    def self.down
        add_column :posts, :privacy_level_id, :integer
    end
end