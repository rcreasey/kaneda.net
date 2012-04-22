# $Id$

class CreatePeople < ActiveRecord::Migration
    def self.up
        create_table :people, :force => true do |t|
            t.column :account_name,                 :string
            t.column :display_name,                 :string
            t.column :email_address,                :string
            t.column :old_password,                 :string, :limit => 40
            t.column :crypted_password,             :string, :limit => 40
            t.column :salt,                         :string, :limit => 40
            t.column :remember_token,               :string
            t.column :remember_token_expires_at,    :datetime
            t.column :activation_code,              :string, :limit => 40
            t.column :activated_on,                 :datetime
            t.column :created_on,                   :datetime
            t.column :updated_on,                   :datetime
        end
    end

    def self.down
        drop_table :people
    end
end