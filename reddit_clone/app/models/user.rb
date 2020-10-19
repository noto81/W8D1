class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true}
    validates :password_digest, presence: true
    
    has_many :posts,
    class_name: :Post,
    foreign_key: :author_id,
    primary_key: :id 
    
    has_many :subs,
    class_name: :Sub,
    foreign_key: :moderator_id 


    attr_reader :password 
    after_initialize :ensure_session_token

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user && is_password?(password)
        user
    end
        
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        bc_password = BCrypt::Password.new(self.password_digest)
        bc_password.is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.base64(64)
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.base64(64)
    end
end
