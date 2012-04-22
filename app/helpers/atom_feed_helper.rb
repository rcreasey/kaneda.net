# $Id$

module AtomFeedHelper
    
    def tag_uri_for_string(tag_string)
        "tag:kaneda.net,#{tag_string}"
    end
    
    def tag_uri_for_feed
        tag_uri_for_string "2007:#{@controller.controller_name}.#{params[:action]}"
    end
    
    def tag_uri_for_record(entry, identifier)
        tag_uri_for_string "#{entry.created_on.strftime('%Y-%m')}:#{identifier}"
    end
    
end