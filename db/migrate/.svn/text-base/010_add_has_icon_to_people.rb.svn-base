# $Id$

class AddHasIconToPeople < ActiveRecord::Migration
    def self.up
        add_column :people, :has_icon, :boolean, :default => 0
    end

    def self.down
        remove_column :people, :has_icon
    end
end