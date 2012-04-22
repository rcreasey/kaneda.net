# $Id$

module TagsHelper

    def tags_for(parent)
        parent.tags.blank? ? 'No tags' : 'Tagged ' + link_to_tags_for(parent)
    end
    
	def link_to_tags_for(parent)
		links = []        
        parent.tags.uniq.each { |tag| links << link_to_tag(tag, parent.class.to_s) }
        links.join(' ')
	end
	
	def link_to_tag(tag, klass)
	    link_to(tag.name.downcase, url_for_tag(tag, klass), :title => "View items tagged with '#{tag.name.downcase}'.", :class => 'tag', :rel => 'tag')
    end
    
    def url_for_tag(tag, klass)
        url_for(:controller => 'tags',
                :action => 'index_by_tags_for_class',
                :klass => klass.pluralize.downcase,
                :tags => tag.name.downcase)
    end

end
