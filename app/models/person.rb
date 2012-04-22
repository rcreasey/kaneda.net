# $Id$

require 'digest/sha1'

class Person < ActiveRecord::Base
    
    acts_as_taggable
    attr_accessor               :password

    validates_confirmation_of   :password,                      :if => :password_required?
    validates_acceptance_of     :accepts_tos,                   :message => ' - like, for real', :on => :create
    validates_exclusion_of      :account_name,                  :in => Exclusion::COMMON_WORDS
    validates_format_of         :account_name,                  :with => /^[a-z0-9_]{3,15}$/, :message => 'It must be 3-15 lowercase letters or numbers'
    validates_format_of		    :display_name,					:with => /^.{1,30}$/i, :message => 'It must be between 1-30 characters', :if => Proc.new { |person| !person.display_name.blank? }
    validates_format_of         :email_address,                 :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => 'It must be an actual, valid address'
    validates_format_of         :password,                      :with => /^[a-z0-9]{4,40}$/i, :message => 'It must be 4-40 letters or numbers', :on => :create
    validates_format_of         :tag_list,                      :with => /^([a-z0-9-]{3,20} ?)+$/i, :message => 'It each need to be 3-20 letters, numbers or punctionation symbols', :if => Proc.new { |post| !post.tag_list.blank? }
    validates_uniqueness_of     :account_name, :email_address,  :case_sensitive => false

    before_save                 :encrypt_password
    before_create               :make_activation_code
    
    has_many                    :comments, :order => 'created_on desc'
    has_many   	                :posts, :order => 'created_on desc'
    has_many                    :settings

    def self.authenticate(account_name, password)
        person = find :first, :conditions => ['account_name = ? and activated_on IS NOT NULL', account_name]
        return nil if person.nil?
        
        unless person.old_password.blank?
            return nil unless person.move_old_password_to_new(password)
        end
        
        person.authenticated?(password) ? person : nil
    end

    def self.encrypt(password, salt)
        Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end

    def activate
        @activated = true
        self.attributes = {:activated_on => Time.now.utc, :activation_code => nil}
        save(false)
    end

    def recently_activated?
        @activated
    end    

    def encrypt(password)
        self.class.encrypt(password, salt)
    end

    def authenticated?(password)
        crypted_password == encrypt(password)
    end

    def find_by_remember_token?
        remember_token_expires_at && Time.now.utc < remember_token_expires_at 
    end

    def remember_me
        self.remember_token_expires_at = 2.weeks.from_now.utc
        self.remember_token            = encrypt("#{email_address}--#{remember_token_expires_at}")
        save(false)
    end

    def forget_me
        self.remember_token_expires_at = nil
        self.remember_token            = nil
        save(false)
    end

    def name
        display_name.blank? ? account_name : display_name
    end
    
    def first_name
        name.split[0]
    end
    
    def store_icon(image_file, file_extension)
        file = File.open "#{RAILS_ROOT}/public/images/icons/people/#{account_name}.#{file_extension}", "wb"
        
        return false if file.nil?
        return false unless file.write(image_file.read)
            
        file.close
        
        return update_attributes(:has_icon => true, :icon_type => file_extension)
    end
    
    def move_old_password_to_new(password)
        update_attribute('old_password', nil) &&
        update_attribute('salt', make_salt) &&
        update_attribute('crypted_password', encrypt(password))
    end
    
    def setting(name)
        (setting = settings.find_by_name(name)).blank? ? nil : setting.value
    end
    
    def to_xml(options = {})
        options[:indent] ||= 2
        xml = options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent])
        xml.instruct! unless options[:skip_instruct]
              
        xml.person(:id => id) do
            xml.tag!(:account_name, account_name)
            xml.tag!(:display_name, display_name)
            xml.tag!(:profile, profile)
            xml.tag!(:created_on, created_on)
            xml.tag!(:updated_on, updated_on)
        end
    end

    protected
		def make_activation_code
			self.activation_code = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by {rand}.join)
		end
	
		def encrypt_password
			return if password.blank?
			self.salt = make_salt if new_record?
			self.crypted_password = encrypt(password)
		end
	
		def password_required?
			crypted_password.blank? || !password.blank?
		end
	
		def make_salt
			Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{account_name}--")
		end

end