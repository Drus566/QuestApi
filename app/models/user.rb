class User < ApplicationRecord
    has_many :room_first_user_id, :class_name => 'Room', foreign_key: :first_user_id 
    has_many :room_second_user_id, :class_name => 'Room', foreign_key: :second_user_id
    has_one :profile

    before_save :downcase_email
    validates :name, presence: true, length: { maximum: 24 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
                    length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    def to_token_payload
        {
            sub: id,
            email: email,
            name: name,
        }
    end

    private 

        def downcase_email
            self.email = email.downcase
        end
end
