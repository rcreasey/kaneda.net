# $Id$

class DropPeoplePosts < ActiveRecord::Migration
    def self.up
        drop_table :people_posts
    end

    def self.down
        create_table :people_posts, :force => true do |t|
            t.column :person_id, :integer
            t.column :post_id, :integer
        end
    end
end