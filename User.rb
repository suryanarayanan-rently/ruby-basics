require "json"
require_relative "utils.rb"
class User
    
    attr_accessor :name
    attr_accessor :username
    attr_accessor :password

    def initialize(name,username,password)
        self.name = name
        self.username=username
        self.password=password
    end

    def to_s
        print "[#@name,#@username]"
    end

end
    

class PropertyManager < User
    attr_accessor :properties
    def initialize(name,username,password)
        @name = name
        @username = username
        @password = password 
        db = get_db()
        db["property_managers"][@username] = {"name":@name,"username":@username,"password":@password,"properties":Hash.new}
        write_to_db_file(db)
    end
    def to_s
        print "[#@name,#@username,#@properties]"
    end
end

class Renter < User
    def initialize(name,username,password)
        @name = name
        @username = username
        @password = password 
        db_file = get_db()
        db["renters"][@username] = {"name":@name,"username":@username,"password":@password}
        write_to_db_file(db)  
    end
end
