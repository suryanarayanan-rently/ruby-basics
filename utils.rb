require "json"


def get_db()
    begin
        db_file = File.read("./application_db.json")
        db = JSON.parse(db_file)
        return db
    rescue => exception
        puts("Unable to Open Database file")
        puts(exception)
        exit()
    end
end

def write_to_db_file(db)
    begin
        File.write("./application_db.json",JSON.dump(db))
    rescue => exception 
        puts("Exception Oocured while saving to database file")
        puts(exception)
        exit()
    end
end
    

def check_is_username_available(username)
    db = get_db()
    if db["renters"].has_key?(username) || db["property_managers"].has_key?(username)
        return false
    end
    return true
end





