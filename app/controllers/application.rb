# $Id$

class ApplicationController < ActionController::Base

  include AuthenticatedSystem
  before_filter :select_format
  before_filter :login_from_cookie
  helper :atom_feed, :comments, :people, :posts, :tags
  layout 'xhtml'
  
  def select_format
    host = request.env["HTTP_X_FORWARDED_HOST"] ? request.env["HTTP_X_FORWARDED_HOST"] : request.env["HTTP_HOST"]
    
    request.env['HTTP_ACCEPT'] = 'text/xml' if host.starts_with? 'xml.'
    request.env['HTTP_ACCEPT'] = 'application/atom+xml' if host.starts_with? 'feed.'
  end
  
  def show_about
    render :action => 'about'
  end
  
  def show_terms_of_service
    render :action => 'tos'
  end
  
  def rescue_action_in_public(exception = nil)
    render :template => "/shared/error"
  end
  
  def local_request?
    return false
  end
  
  private
    def check_for_person_logged_in
    unless logged_in?
      flash[:notice] = 'Sorry, but you need to log in first!'
      session[:redirect_url] = request.request_uri
      redirect_to '/'
    end
    
    true
    end
    
    def check_for_ownership
      unless logged_in? && params[:account_name].downcase == current_person.account_name.downcase
        flash[:notice] = 'Sorry, but you\'re not allowed to do that!'
        redirect_to '/'
      end
      
      true
    end
end
