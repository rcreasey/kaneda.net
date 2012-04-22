# $Id$

class DropPrivacyLevels < ActiveRecord::Migration
    def self.up
        drop_table :privacy_levels
    end

    def self.down
        create_table :privacy_levels, :force => true do |t|
            t.column :name,                 :string
        end
    end
end
