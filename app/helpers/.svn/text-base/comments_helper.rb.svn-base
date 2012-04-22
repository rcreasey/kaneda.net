# $Id$

module CommentsHelper

    def summary_for_comment(comment, link_to_person = true)
        result  = link_to_person ? "#{link_to_person(comment.person)} posted this" : "Posted"
        result += " #{time_ago_in_words comment.created_on} ago"
        result += " #{link_to_comments_by_person(comment.person)}" unless current_page?(:controller => 'comments', :action => 'index_for_account_name', :account_name => comment.person.account_name)
        result += '.'
        
        result
    end
    
    def link_to_comment(comment, link_string)
        link_to(link_string, url_for_comment(comment), :title => "View the comment posted by #{sanitize(comment.person.name)}.")
    end
    
    def link_to_comments_for(item, url, just_comment_count = false)
	    link_to(just_comment_count ? item.comments.length : comments_string_for(item), url + '#comments', :title => "View comments for '#{sanitize(item.title)}'.", :class => 'replies')
    end
    
    def comments_string_for(item)
        result  = item.comments.length.to_s + ' comment'
        result += 's' if item.comments.length != 1
        
        result
    end
    
    def url_for_comment(comment)
        eval "url_for_#{comment.commentable.class.to_s.downcase}(comment.commentable) + '#comment-' + comment.id.to_s"
    end
    
end