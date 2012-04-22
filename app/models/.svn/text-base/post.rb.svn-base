# $Id$

class Post < ActiveRecord::Base

    acts_as_taggable
    acts_as_versioned
    
    validates_exclusion_of      :title,                  :in => Exclusion::COMMON_WORDS
    validates_format_of         :title,                  :with => /^[[:punct:][:alnum:] ]{3,60}$/, :message => 'must be 3-60 letters, numbers or punctuation symbols'
    validates_format_of         :tag_list,               :with => /^([a-z0-9-]{3,20} ?)+$/i, :message => 'each need to be 3-20 letters, numbers or punctionation symbols', :if => Proc.new { |post| !post.tag_list.blank? }
    validates_uniqueness_of     :title,                  :case_sensitive => false, :scope => :person_id
    validates_presence_of       :contents
    
    attr_accessor               :is_selected
    has_many                    :comments, :as => :commentable
    has_and_belongs_to_many     :categories
    belongs_to                  :person
    
    has_permalink               :title
    
    self.non_versioned_columns << 'title'
    self.non_versioned_columns << 'permalink'
    
    def created_year
        created_on.strftime('%Y')
    end
    
    def created_month
        created_on.strftime('%m')
    end
    
    def created_day
        created_on.strftime('%d')
    end
    
    def Post.find_by_permalink_for_account_name(permalink, account_name)
        Post.find(:first, :conditions => ['posts.permalink=? and people.account_name=?', permalink, account_name], :include => :person)
    end
           
end