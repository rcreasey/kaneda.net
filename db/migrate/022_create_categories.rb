# $Id$

class CreateCategories < ActiveRecord::Migration
    def self.up
        create_table :categories do |t|
            t.column :name, :string, :limit => 30
            t.column :description, :text
            t.column :url, :string, :limit => 15
            t.column :tags, :string, :limit => 50
            t.column :created_on, :datetime
            t.column :updated_on, :datetime
        end

        create_table :categories_posts do |t|
            t.column :category_id, :integer
            t.column :post_id, :integer
        end
    end

    def self.down
        drop_table :categories_posts  
        drop_table :categories
    end
end
