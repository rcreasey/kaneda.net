# $Id$

class Comment < ActiveRecord::Base

    acts_as_versioned
    
    validates_presence_of       :contents
    belongs_to                  :commentable, :polymorphic => true
    belongs_to                  :person
    
end
