# $Id$

class AddPrivacyLevelIdToPosts < ActiveRecord::Migration
    def self.up
        add_column :posts, :privacy_level_id, :integer
    end

    def self.down
        remove_column :posts, :privacy_level_id
    end
end