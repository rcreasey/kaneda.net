# $Id$

class ChangePostContentsToText < ActiveRecord::Migration
    def self.up
        change_column :posts, :contents, :text
        change_column :post_versions, :contents, :text
    end

    def self.down
        change_column :posts, :contents, :string
        change_column :post_versions, :contents, :string
    end
end