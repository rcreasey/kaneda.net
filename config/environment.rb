require File.join(File.dirname(__FILE__), 'boot')

require 'exclusion'
require 'string_extensions'

Rails::Initializer.run do |config|
    config.active_record.observers = :person_observer
    config.action_controller.session = { :session_key => "_kaneda.net_session_id", :secret => "aba64755b2ba68801a71d0734840b69169c45c4ffc55908401820315886bbcbea159535c643b95991360e38b36475982ead7851092daf6f22a60dfc377d5f3f4" }
end

ActionView::Base.field_error_proc = Proc.new do |tag, instance|
    tag
end

Mime::Type.register 'image/gif',    :gif
Mime::Type.register 'image/jpeg',   :jpeg
Mime::Type.register 'image/jpg',    :jpg
Mime::Type.register 'image/png',    :png

TagList.delimiter = ' '
