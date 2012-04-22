# $Id$

class ChangeCommentContentsToText < ActiveRecord::Migration
    def self.up
        change_column :comments, :contents, :text
    end

    def self.down
        change_column :comments, :contents, :string
    end
end