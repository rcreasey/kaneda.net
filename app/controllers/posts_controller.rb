# $Id$

class PostsController < ApplicationController
    before_filter :check_for_person_logged_in, :only => [:new, :create, :comment_on_post, :index_for_current_person]
    before_filter :check_for_ownership, :only => [:edit, :update, :delete]
    before_filter :set_current_tab
    
    def index
    	@title = 'The latest'
        @pages, @posts = paginate :post, :order => 'created_on desc'
        
        respond_to do |format|
            format.html
            format.atom { render :action => 'feeds/index', :layout => false }
            format.xml { render :xml => @posts.to_xml(:include => :person) }
        end
    end
    
    def index_by_date
        date  = params[:year]
        date += "-#{params[:month]}" if params[:month]
        date += "-#{params[:day]}" if params[:day]
        
        @title = "The posts @ #{date}"
        @pages, @posts = paginate :post, :conditions => ['created_on like ?', "#{date}%"], :order => 'created_on desc'
        
        respond_to do |format|
            format.html { render :action => 'index' }
            format.atom { render :action => 'feeds/index', :layout => false }
            format.xml { render :xml => @posts.to_xml(:include => :person) }
        end
    end
    
    def index_for_current_person
        params[:account_name] = current_person.account_name
        index_for_account_name
    end
    
    def index_for_account_name
        @title = "The posts by #{params[:account_name]}"
        @pages, @posts = paginate :post, :conditions => ['people.account_name=?', params[:account_name]], :include => :person, :order => 'posts.created_on desc'
        
        respond_to do |format|
            format.html { render :action => 'index' }
            format.atom { render :action => 'feeds/index', :layout => false }
            format.xml { render :xml => @posts.to_xml(:include => :person) }
        end
    end
    
    def index_by_date_for_account_name
        date  = params[:year]
        date += "-#{params[:month]}" if params[:month]
        date += "-#{params[:day]}" if params[:day]
        
        @title = "The posts by #{params[:account_name]} @ #{date}"
        @pages, @posts = paginate :post,
                                  :conditions => ['posts.created_on like ? and people.account_name=?', "#{date}%", params[:account_name]],
                                  :include => :person,
                                  :order => 'posts.created_on desc'
        
        respond_to do |format|
            format.html { render :action => 'index' }
            format.atom { render :action => 'feeds/index', :layout => false }
            format.xml { render :xml => @posts.to_xml(:include => :person) }
        end
    end
    
    def get_by_permalink_for_account_name
        @post = Post.find_by_permalink_for_account_name(params[:permalink], params[:account_name])
        
        unless @post.nil?
            @title = @post.title
            @post.is_selected = true
        end
        
        respond_to do |format|
            format.html { render :action => 'show' }
            format.atom { render :action => 'feeds/show', :layout => false }
            format.xml { render :xml => @post.to_xml(:include => :person) }
        end
    end

    def create
        @title = 'Make a post'
        @current_tab = :posts_post
        
        @post = Post.new(params[:post])        
        if request.post? && @post.save
            flash[:notice] = '<strong>Yay!</strong> Your post has been created.'
            redirect_to url_for_post(@post)
        else
            render :action => 'new'
        end
    end
    
    def edit
	    @title = 'Edit your post'
        @post = Post.find_by_permalink_for_account_name(params[:permalink], params[:account_name])
    end
    
    def update
        @post = Post.find_by_permalink_for_account_name(params[:permalink], params[:account_name])
        if @post.update_attributes(params[:post])
            flash[:notice] = '<strong>Woo!</strong> Your post has been updated.'
            redirect_to url_for_post(@post)
        else
            render :action => 'edit'
        end
    end
    
    def url_for_post(post)
        url_for(:controller => 'posts',
                :action => 'get_by_permalink_for_account_name',
                :account_name => post.person.account_name,
                :permalink => post.permalink,
                :year => post.created_year,
                :month => post.created_month,
                :day => post.created_day)
    end
    
    def comment_on_post
        @post = Post.find_by_permalink_for_account_name(params[:permalink], params[:account_name])
        
        unless @post.nil?
            @comment = Comment.new(params[:comment])
            @comment.person = current_person            
            @post.comments << @comment
        
            redirect_url = url_for_post(@post)
            if @comment.save
                 redirect_url += "#comment-#{@comment.id}"
            end
            
            redirect_to redirect_url
        else
            redirect_to url_for(:controller => 'posts') 
        end
    end
    
    def set_current_tab
        @current_tab = :posts
    end
    
end
