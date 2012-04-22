# $Id$

class CreatePrivacyLevels < ActiveRecord::Migration
    def self.up
        create_table :privacy_levels, :force => true do |t|
            t.column :name,                 :string
        end
    end

    def self.down
        drop_table :privacy_levels
    end
end
