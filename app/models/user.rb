class User < ActiveRecord::Base
    has_many :books
    has_secure_password
 # ActiveRecord method (predefined)
    # provides a reader/writer method for password

    validates :email, uniqueness: {message: "%{value} is already in use.  Please select another or login."}
    validates :email, presence: true
end

#using the validates meant I got to remove all the code on the
#controller that was if_blank || blah blah blah && !something else
#uniqueness makes sure the same username isn't used twice. i also put that for email.
#and then that message shows if it violates