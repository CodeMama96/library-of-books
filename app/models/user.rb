class User < ActiveRecord::Base
    has_many :books
    has_secure_password

    validates :email, uniqueness: {message: "%{value} is already in use.  Please select another or login."}
    validates :email, presence: true
end
