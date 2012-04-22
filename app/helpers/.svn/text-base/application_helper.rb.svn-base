# $Id$

module ApplicationHelper
    
    def show_inline_errors_for(object, attr)
        errors = object.errors.on(attr)
        return if errors.nil?
        
        content_tag('span', errors.is_a?(Array) ? errors.join(', ') : errors, :class => 'error')
    end
    
    def markup(content, options = {})
        options.reverse_merge! :should_truncate => false, :should_sanitize => true, :use_markdown => true
        
        if content.blank?
            content_tag('p', content_tag('em', "This is, unusually, blank."))
        else
            markup = content
            
            if options[:should_truncate]
                parts = markup.split(/\r\n/)
                markup = parts.nil? ? content : parts[0].chop + ".."
            end
            
            markup = sanitize(markup) if options[:should_sanitize]
            markup = markdown(markup) if options[:use_markdown]
            
            markup
        end
    rescue
        content.blank? ? '' : content_tag('p', sanitize(content))
    end
    
    def show_page_boy(paginator, type = 'item')
        return if paginator.nil? || paginator.item_count < 1
        
        type = type.pluralize unless paginator.item_count == 1
        page_boy = content_tag('strong', "#{paginator.item_count} #{type}")

        if paginator.page_count > 1
            page_boy += ' '
            page_boy += paginator.current.previous ? 
                            link_to('Previous', {:page => paginator.current.previous}, :title => 'View the previous page.') : 'Previous'
            page_boy += ' / '
            page_boy += paginator.current.next ? 
                            link_to('Next', {:page => paginator.current.next}, :title => 'View the next page.') : 'Next'
            page_boy += ' | '
            page_boy += pagination_links(paginator)
        end

        content_tag('p', page_boy, :class => 'pagination')
    end
    
    def recent_posts_list( limit = 5 )
        list = ""
        Post.find(:all, :order => 'created_on desc', :limit => limit).each do |p| 
            list += content_tag(:li, "#{time_ago_in_words p.created_on} ago: #{link_to_post(p)}")
        end
        content_tag(:ul, list, :id => 'recent_posts')
    end
    
end
