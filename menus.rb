require_relative "utils.rb"
require_relative "Property.rb"
def show_renter_options(username)
    puts("1. Show Available Properties ")
    puts("2. Exit")
    option = gets.chomp.to_i 
    case option
    when 1
        db = get_db()
        db["property_managers"].each_key do |pm|
            db["property_managers"][pm]["properties"].each_value do |property|
                print(property)
            end
        end
        show_renter_options(username)
    when 2
        exit
    else
        print("Invalid Options")
        show_renter_options(username)
    end
end

def show_property_manager_options(username)
    
    puts("1. Show My Properties ")
    puts("2. Create new Property")
    puts("3. Exit")
    option = gets.chomp.to_i 
    case option
    when 1
        db = get_db()
        db["property_managers"][username]["properties"].each_value do |property|
            print(property)
        end
        show_property_manager_options(username)
    when 2
        print("Enter Type")
        type = gets.chomp
        print("City: ")
        city = gets.chomp 
        print("BHK: ")
        bhk = gets.chomp.to_i
        print("Cost: ")
        cost = gets.chomp.to_i 
        Property.new(type,city,bhk,cost,username)
        print("Property Added")
        show_property_manager_options(username)
    when 3
        exit
    else
        print("Invalid Options")
        show_property_manager_options(username)
    end
end