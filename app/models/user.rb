class User < ActiveRecord::Base
    has_many :books
    has_secure_password

    validates :email, uniqueness: {message: "%{value} is already in use.  Please select another or login."}
    validates :email, presence: true
end

#uniqueness makes sure the same email isn't used twice.
#and then that message shows if it violates


 # ActiveRecord method (predefined)
    # provides a reader/writer method for password

