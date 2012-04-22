# $Id$

module PeopleHelper

    def link_to_person(person, options = {})
        options.reverse_merge! :identify_as_current => true, :use_full_name => true
        link_to_person_as(person, options[:identify_as_current] && is_current_person(person) ? "<strong>You</strong>" : sanitize(options[:use_full_name] ? person.name : person.first_name))
    end

    def link_to_person_icon(person, size = '32x32')
    	link_to_person_as(person, icon_image_for_person(person, size))
	end
	
    def link_to_person_as(person, link_string)
        link_to(link_string, url_for(:controller => 'people', :action => 'get_by_account_name', :account_name => person.account_name), :title => "View #{sanitize(person.account_name).with_ownership} profile.", :class => 'person')
    end
    
	def link_to_posts_by_person(person, link_string = "(more)")
		link_to(link_string, url_for(:controller => 'posts', :action => 'index_for_account_name', :account_name => person.account_name), :title => "View more posts by #{sanitize(person.name)}.", :class => 'more posts')
    end
    
    def link_to_comments_by_person(person, link_string = "(more)")
        link_to(link_string, url_for(:controller => 'comments', :action => 'index_for_account_name', :account_name => person.account_name), :title => "View more comments by #{sanitize(person.name)}.", :class => 'more comments')
    end
    
	def icon_image_for_person(person, size = '32x32')
		person.has_icon ? image_tag("icons/people/#{person.account_name}.#{person.icon_type}", :size => size, :alt => "#{person.account_name}: ", :class => 'icon') :
		                  default_icon_image(size)
	end
	
	def default_icon_image(size = '32x32')
	    image_tag('icons/people/_default.jpg', :size => size, :alt => "Guest", :class => 'icon')
    end
	
	def is_current_person(person)
	    logged_in? && current_person.account_name == person.account_name
    end
    
    def url_for_person(person)
	    url_for(:controller => 'people', :action => 'get_by_account_name', :account_name => person.account_name)
    end
       
end