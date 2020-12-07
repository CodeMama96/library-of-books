class User < ActiveRecord::Base

    has_many :books

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end
