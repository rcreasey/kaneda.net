ActionController::Routing::Routes.draw do |map|
    map.login       		'login', :controller => 'people', :action => 'login'
    map.logout      		'logout', :controller => 'people', :action => 'logout'
    map.post        		'post', :controller => 'posts', :action => 'create'
    map.signup      		'signup', :controller => 'people', :action => 'signup'
    
    map.my_icon_delete     	'my/icon/sucks', :controller => 'people', :action => 'remove_icon'
    map.my_icon_update     	'my/icon/update', :controller => 'people', :action => 'update_icon'
    map.my_icon     		'my/icon', :controller => 'people', :action => 'edit_icon'    
    map.my_profile_update	'my/profile/update', :controller => 'people', :action => 'update_profile'
    map.my_profile     		'my/profile', :controller => 'people', :action => 'edit_profile'
    map.my_posts             'my/posts', :controller => 'posts', :action => 'index_for_current_person'
    
    map.about               'about', :controller => 'application', :action => 'show_about'
    map.about_tos           'about/tos', :controller => 'application', :action => 'show_terms_of_service'

    map.connect     		':klass/tags/:tags', :controller => 'tags', :action => 'index_by_tags_for_class', :requirements => {:klass => /posts|people/, :tags => /([a-z0-9-]{3,20}[+ ]?)+/}
    map.connect     		':klass/tags', :controller => 'tags', :action => 'index_for_class', :requirements => {:klass => /posts|people/, :tags => /[a-z0-9-]{3,20}/}
    map.connect     		'tags/:tags', :controller => 'tags', :action => 'index_by_tags', :requirements => {:tags => /[a-z0-9-]{3,20}/}
    
    map.connect     		'people/:account_name', :controller => 'people', :action => 'get_by_account_name', :requirements => {:account_name => /[a-z0-9_]{3,15}/}

    map.connect    			'posts/:year/:month/:day', :controller => 'posts', :action => 'index_by_date', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/}
    map.connect     		'posts/:year/:month', :controller => 'posts', :action => 'index_by_date', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/}
    map.connect   			'posts/:year', :controller => 'posts', :action => 'index_by_date', :requirements => {:year => /\d{4}/}    

    map.connect    			'posts/:account_name/:year/:month/:day/:permalink/update', :controller => 'posts', :action => 'update', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/, :account_name => /[a-z0-9_]{3,15}/, :permalink => /[[:punct:][:alnum:]]+/}
    map.connect    			'posts/:account_name/:year/:month/:day/:permalink/edit', :controller => 'posts', :action => 'edit', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/, :account_name => /[a-z0-9_]{3,15}/, :permalink => /[[:punct:][:alnum:]]+/}
    map.connect    			'posts/:account_name/:year/:month/:day/:permalink/comment', :controller => 'posts', :action => 'comment_on_post', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/, :account_name => /[a-z0-9_]{3,15}/, :permalink => /[[:punct:][:alnum:]]+/}
    map.connect    			'posts/:account_name/:year/:month/:day/:permalink', :controller => 'posts', :action => 'get_by_permalink_for_account_name', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/, :account_name => /[a-z0-9_]{3,15}/, :permalink => /[[:punct:][:alnum:]]+/}
    map.connect     		'posts/:account_name/:year/:month/:day', :controller => 'posts', :action => 'index_by_date_for_account_name', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/, :account_name => /[a-z0-9_]{3,15}/}
    map.connect     		'posts/:account_name/:year/:month', :controller => 'posts', :action => 'index_by_date_for_account_name', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/, :account_name => /[a-z0-9_]{3,15}/}
    map.connect     		'posts/:account_name/:year', :controller => 'posts', :action => 'index_by_date_for_account_name', :requirements => {:year => /\d{4}/, :account_name => /[a-z0-9_]{3,15}/}
    map.connect     		'posts/:account_name', :controller => 'posts', :action => 'index_for_account_name', :requirements => {:account_name => /[a-z0-9_]{3,15}/}

    map.connect    			'comments/:year/:month/:day', :controller => 'comments', :action => 'index_by_date', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/}
    map.connect     		'comments/:year/:month', :controller => 'comments', :action => 'index_by_date', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/}
    map.connect   			'comments/:year', :controller => 'comments', :action => 'index_by_date', :requirements => {:year => /\d{4}/}    

    map.connect     		'comments/:account_name/:year/:month/:day', :controller => 'comments', :action => 'index_by_date_for_account_name', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/, :account_name => /[a-z0-9_]{3,15}/}
    map.connect     		'comments/:account_name/:year/:month', :controller => 'comments', :action => 'index_by_date_for_account_name', :requirements => {:year => /\d{4}/, :month => /\d{1,2}/, :account_name => /[a-z0-9_]{3,15}/}
    map.connect     		'comments/:account_name/:year', :controller => 'comments', :action => 'index_by_date_for_account_name', :requirements => {:year => /\d{4}/, :account_name => /[a-z0-9_]{3,15}/}    
    map.connect     		'comments/:account_name', :controller => 'comments', :action => 'index_for_account_name', :requirements => {:account_name => /[a-z0-9_]{3,15}/}
    
    map.connect     		':controller/:action/:id', :controller => 'posts'
    map.connect             '*path', :controller => 'application', :action => 'rescue_action_in_public', :exception => 'x' #unless ::ActionController::Base.consider_all_requests_local
end
