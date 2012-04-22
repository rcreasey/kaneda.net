# $Id$

class CreateSettings < ActiveRecord::Migration
    def self.up
        create_table :settings do |t|
            t.column :person_id, :integer
            t.column :name, :string, :limit => 30
            t.column :value, :string, :limit => 50
            t.column :created_on, :datetime
            t.column :updated_on, :datetime
        end
    end

    def self.down
        drop_table :settings
    end
end
