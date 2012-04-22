# $Id$

class AddPermalinkToPosts < ActiveRecord::Migration
    def self.up
        add_column :posts, :permalink, :string
    end

    def self.down
        remove_column :posts, :permalink
        remove_column :post_versions, :person_id
    end
end