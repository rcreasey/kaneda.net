# $Id$

class TagsController < ApplicationController

    before_filter :set_current_tab
    
    def index
    end
    
    def index_for_class
        render :action => 'index'
    end
    
    def index_by_tags
        render :action => 'index'
    end
    
    def index_by_tags_for_class
        klass = params[:klass].classify
        tag_string = @params[:tags].split.join(', ')
        count = 0
        
        @title = "#{klass.pluralize} tagged with '#{tag_string}'."
        
        tags = Tag.find(:all, :conditions => ["name in (?)", tag_string])
        unless tags.nil?
            tags.each do |tag|
                tag.taggings.each { |tagging| count += 1 if tagging.taggable_type == klass }
            end
        
            @pages = Paginator.new self, count, 10, params[:page]
            eval("@tagged_items = @#{params[:klass]} = #{klass}.find_tagged_with(params[:tags], {:match_all => true, :limit => @pages.items_per_page, :offset => @pages.current.offset, :order => 'created_on desc'})")
        end
        
        respond_to do |format|
            format.html { render "/#{params[:klass]}/index" }
            format.atom { render :template => "/#{params[:klass]}/feeds/index", :layout => false }
            format.xml { render :xml => @tagged_items.to_xml }
        end
    end
    
    def set_current_tab
        @current_tab = :tags
    end
        
end