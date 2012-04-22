# $Id$

class CommentsController < ApplicationController
    
    before_filter :set_current_tab
    
    def index
        @title = 'The comments'
        @pages, @comments = paginate :comments, :order => 'created_on desc'
        
        respond_to do |format|
            format.html
            format.atom { render :action => 'feeds/index', :layout => false }
            format.xml { render :xml => @comments.to_xml }
        end        
    end

    def index_by_date
        date  = params[:year]
        date += "-#{params[:month]}" if params[:month]
        date += "-#{params[:day]}" if params[:day]
        
        @title = "The comments @ #{date}"
        @pages, @comments = paginate :comments, :conditions => ['created_on like ?', "#{date}%"], :order => 'created_on desc'
        
        respond_to do |format|
            format.html { render :action => 'index' }
            format.atom { render :action => 'feeds/index', :layout => false }
            format.xml { render :xml => @comments.to_xml(:include => :person) }
        end
    end

    def index_for_current_person
        params[:account_name] = current_person.account_name
        index_for_account_name
    end
    
    def index_for_account_name
        @title = "The comments by #{params[:account_name]}"
        @pages, @comments = paginate :comments, :conditions => ['people.account_name=?', params[:account_name]], :include => :person, :order => 'comments.created_on desc'
        
        respond_to do |format|
            format.html { render :action => 'index' }
            format.atom { render :action => 'feeds/index', :layout => false }
            format.xml { render :xml => @comments.to_xml(:include => :person) }
        end
    end

    def index_by_date_for_account_name
        date  = params[:year]
        date += "-#{params[:month]}" if params[:month]
        date += "-#{params[:day]}" if params[:day]
        
        @title = "The comments by #{params[:account_name]} @ #{date}"
        @pages, @comments = paginate :comments,
                                     :conditions => ['comments.created_on like ? and people.account_name=?', "#{date}%", params[:account_name]],
                                     :include => :person,
                                     :order => 'comments.created_on desc'
        
        respond_to do |format|
            format.html { render :action => 'index' }
            format.atom { render :action => 'feeds/index', :layout => false }
            format.xml { render :xml => @comments.to_xml(:include => :person) }
        end
    end
    
    def set_current_tab
        @current_tab = :comments
    end
    
end
