# $Id$

class CreateComments < ActiveRecord::Migration
    def self.up
        create_table :comments, :force => true do |t|
            t.column :post_id, :integer
            t.column :person_id, :integer            
            t.column :contents, :string
            t.column :created_on, :datetime
            t.column :updated_on, :datetime
        end
    end

    def self.down
        drop_table :comments
    end
end