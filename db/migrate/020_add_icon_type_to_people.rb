# $Id$

class AddIconTypeToPeople < ActiveRecord::Migration
    def self.up
        add_column :people, :icon_type, :string, :limit => 4, :default => 'jpg'
    end

    def self.down
        remove_column :people, :icon_type
    end
end