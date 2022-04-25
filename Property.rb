require_relative "utils.rb"
class Property
    attr_accessor :id
    attr_accessor :type
    attr_accessor :city
    attr_accessor :bhk
    attr_accessor :cost
    attr_accessor :owner
    attr_accessor :created_at
    def initialize(type,city,bhk,cost,owner)
        @id = rand(0..1000)
        @type = type
        @city = city
        @bhk = bhk
        @cost = cost
        @owner = owner
        @created_at = Time.now
        db =get_db()
        db["property_managers"][@owner]["properties"][@id] = {"Id":@id,"type":@type,"city":@city,"bhk":@bhk,"cost":@cost,"owner":@owner,"created_at":@created_at.to_i}
        write_to_db_file(db)
    end

    def to_s
        puts "{\n\tid=>#@id,\n\ttype=>#@type,\n\tcity=>#@city,\n\tbhk=>#@bhk,\n\tcost=>#@cost,\n\towner=>#@owner}"
    end
end