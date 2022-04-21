require_relative "User.rb"
require_relative "utils.rb"
require_relative "menus.rb"


def show_options
    puts("Select Any of the following operation")
    puts("1. Signup")
    puts("2. Login")
    puts("3. Exit")
    option = gets.chomp.to_i
    case option
    
    # Signup Flow
    when 1
        print("Name: ")
        name = gets.chomp
        print("Username: ")
        username = gets.chomp
        print("Password: ")
        password = gets.chomp
        print("Renter(R)/Property Manager(P): ")
        user_type = gets.chomp.capitalize
        
        # checking if the given username already exists
        if check_is_username_available(username) ^ true
            puts("Username already exists !!! Try again")
            show_options()
        end

        # saving user as renter or property manager based on the user_type given
        
        if user_type == "R"
            Renter.new(name,username,password)
        else
            PropertyManager.new(name,username,password)

        end 
        puts("User created successfully")
    
    #Login Flow
    when 2
        print("Renter Login(R)/ Property Manager Login(P): ")
        user_type = gets.chomp 
        print("Username: ")
        username = gets.chomp
        print("Password: ")
        password = gets.chomp
        
        db = get_db()

        # checking if the user has give the correct username and password
        if user_type == "R"
            if db["renters"].has_key?(username) and db["renters"][username]["password"] == password
                puts("Login Successfull")
                show_renter_options(username)
            else
                puts("Login Failed. Please check the credentials")
            end
            
        else
            if db["property_managers"].has_key?(username) and db["property_managers"][username]["password"] == password
                puts("Login Successfull")
                show_property_manager_options(username)
            else
                puts("Login Failed. Please check the credentials")
            end
        end
    when 3
        exit
    else
        print("Invalid Option")
    end
end
        
if __FILE__ == $0
    show_options()
end