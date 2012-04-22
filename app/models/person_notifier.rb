# $Id$

class PersonNotifier < ActionMailer::Base

    def signup_notification(person)
        setup_email(person)
        
        @subject    += 'Hello!'
        @body[:url]  = "http://kaneda.net/people/activate/#{person.activation_code}"
    end

    def activation(person)
        setup_email(person)
        
        @subject    += 'Your account is ready!'
        @body[:url]  = 'http://kaneda.net/'
    end

    protected
    def setup_email(person)        
        @recipients  = "#{person.email_address}"
        @from        = 'nobody@kaneda.net'
        @subject     = 'kaneda.net says: '
        @sent_on     = Time.now
        
        @body[:person] = person
    end
    
end
