# $Id$

class PeopleController < ApplicationController
    
    before_filter :check_for_person_logged_in, :only => [:edit_profile, :update_profile, :edit_icon, :update_icon, :remove_icon]
    before_filter :check_for_person_logged_in, :only => [:edit_profile, :update_profile, :edit_icon, :update_icon, :remove_icon]
    before_filter :set_current_tab
	
    def index
        @title = 'The people'
        @pages, @people = paginate :people, :conditions => ['activated_on is not null'], :order => 'created_on desc'
        
        respond_to do |format|
            format.html
            format.atom { render :action => 'feeds/index', :layout => false }
            format.xml { render :xml => @people.to_xml }
        end
    end

    def get_by_account_name
        @person = Person.find_by_account_name(params[:account_name])
        @title = @person.name unless @person.nil?

        respond_to do |format|
            format.html { render :action => 'show' }
            format.atom { render :action => 'feeds/show', :layout => false }
            format.xml { render :xml => @person.to_xml }
        end
    end
    
    def login
        @title = 'Log in'
		
        if params[:account_name] && params[:password]
            if !request.referer.blank? && request.referer.downcase != url_for(:controller => 'people', :action => 'login')
                uri = URI::parse request.referer
                session[:redirect_url] = request.referer if uri && uri.host.downcase == request.server_name.downcase
            end

            self.current_person = Person.authenticate(params[:account_name], params[:password])
            if logged_in?
                if params[:remember_me] == '1'
                    self.current_person.remember_me
                    cookies[:auth_token] = { :value => self.current_person.remember_token, :expires => self.current_person.remember_token_expires_at }
                end

                flash[:notice] = "Hey, #{self.current_person.first_name}!"
                
                unless session[:redirect_url].blank?
                    redirect_url = session[:redirect_url]
                    session[:redirect_url] = nil
                else
                    redirect_url = url_for(:controller => 'posts')
                end

                redirect_to redirect_url
            else
                flash[:notice] = 'Sorry, but I can\'t log you in! '

                person = Person.find_by_account_name(params[:account_name])
                if !person.nil? && person.activated_on.nil?
                    flash[:notice] += "<strong>Your account needs to be activated first!</strong> Did you get the email that we sent to your #{person.email_address.split('@')[1]} address?"
                else
                    flash[:notice] += 'Please check your spelling and try again.'
                end
            end
        end
    end

    def signup
        @title = 'Sign up'
        @current_tab = :people_signup
        
        @person = Person.new(params[:person])
        return unless request.post?

        @person.save!
        redirect_back_or_default('/')

        flash[:notice] = 'Thanks for joining kaneda.net! We\'ve sent you instructions on how to verify your account.'
    rescue ActiveRecord::RecordInvalid
        render :action => 'signup'
    end

    def activate
        @title = 'Activate your account'
        flash.clear
        
        return if params[:id] == nil and params[:activation_code] == nil
        @person = Person.find_by_activation_code(params[:id] || params[:activation_code])
        
        if @person and @person.activate
            flash[:notice] = '<strong>Sweet!</strong> Your account is now activated, and you\'re free to log in.'
        else
            flash[:notice] = 'Sorry, but I couldn\'t activate your account! Did you follow the link in your welcome email?'
        end
        
        redirect_back_or_default(:controller => '/people', :action => 'login')
    end
    
    def edit_profile
	    @title = 'Edit your profile'
	    @person = current_person
    end
    
    def update_profile
        @person = current_person
        
        if @person.update_attributes(params[:person])
            flash[:notice] = '<strong>Yes!</strong> Your profile has been updated.'
            redirect_to url_for_person(@person)
        else
            render :action => 'edit_profile'
        end
    end
    
    def edit_icon
        @title = 'Edit your icon'
        @person = current_person
    end
    
    def update_icon
        @person = current_person
        
        if params[:icon].blank?
            flash[:notice] = "Sorry, but you're going to need to give me a file if you want an icon!"
        elsif params[:icon].length > 80000 || params[:icon].length < 1
            flash[:notice] = "Sorry, but your file needs to be between 1k and 80k in size!"
        else
            file_extension = nil
            mime_type = Mime::Type.lookup(params[:icon].content_type.strip)
            unless mime_type.nil?
                type_string = mime_type.to_sym
                case type_string
                    when :jpeg
                        file_extension = 'jpg'
                    when :jpg, :png, :gif
                        file_extension = type_string.to_s
                    end
            end 
        
            unless file_extension.blank?
                if @person.store_icon(params[:icon], file_extension)
                    flash[:notice] = "<strong>Gnarly!</strong> Your icon has been updated."
                else
                    @person.update_attribute(:has_icon, false)
                    flash[:notice] = "Sorry, but I couldn't absorb your image!"
                end
            else
                flash[:notice] = "Sorry, but your icon must be a .jpg, .png or .gif!"
            end
        end
        
        redirect_to my_icon_url
    end
    
    def remove_icon
        @person = current_person
        
        if @person.update_attribute(:has_icon, false)
            flash[:notice] = "<strong>Dude!</strong> Your icon is like, totally gone."
        else
            flash[:notice] = "Eep! I couldn't remove your icon. Because of, uh... a glitch. In the Matrix. Yeah, the Matrix."
        end
        
        redirect_to my_icon_url
    end

    def logout
        self.current_person.forget_me if logged_in?
        cookies.delete :auth_token
        reset_session
        flash[:notice] = 'Thanks, dude! You\'re now logged out.'
        redirect_back_or_default(:controller => '/people', :action => 'index')
    end
    
    def url_for_person(person)
	    url_for(:controller => 'people', :action => 'get_by_account_name', :account_name => person.account_name)
    end
    
    def set_current_tab
        @current_tab = :people
    end
    
end
