# $Id$

module PostsHelper
    
    def summary_for_post(post)
        result  = "#{link_to_person(post.person)} posted this #{time_ago_in_words post.created_on} ago"
        result += " #{link_to_posts_by_person post.person}" unless current_page?(:controller => 'posts', :action => 'index_for_account_name', :account_name => post.person.account_name)
        result += ", and updated it #{time_ago_in_words post.updated_on} ago" if post.updated_on > post.created_on
        result += '. '
        result += link_to('Edit your post', url_for_post(post) + '/edit') + '.' if is_current_person(post.person)
        
        result
    end
    
    def link_to_post(post, link_string = nil)
        link_to(link_string.blank? ? sanitize(post.title) : link_string, url_for_post(post), :title => "View '#{sanitize(post.title)}'.")
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
    
    def link_to_post_date(post)
        link_to(post.created_year, "/#{post.created_year}", :title => "Posts from #{post.created_year}.") + "/" +
        link_to(post.created_month, "/#{post.created_year}/#{post.created_month}", :title => "Posts from #{post.created_year}/#{post.created_month}.") + "/" +
        link_to(post.created_day, "/#{post.created_year}/#{post.created_month}/#{post.created_day}", :title => "Posts from #{post.created_year}/#{post.created_month}/#{post.created_day}.")
    end
    
end
