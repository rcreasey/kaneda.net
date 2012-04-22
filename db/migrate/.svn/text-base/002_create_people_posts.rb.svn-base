# $Id$

class CreatePeoplePosts < ActiveRecord::Migration
    def self.up
        create_table :people_posts, :force => true do |t|
            t.column :person_id, :integer
            t.column :post_id, :integer
        end
    end

    def self.down
        drop_table :people_posts
    end
end