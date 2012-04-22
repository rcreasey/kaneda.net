# $Id$

class PersonObserver < ActiveRecord::Observer
    
    def after_create(person)
        PersonNotifier.deliver_signup_notification(person)
    end

    def after_save(person)
        PersonNotifier.deliver_activation(person) if person.recently_activated?
    end
    
end