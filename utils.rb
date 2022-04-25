require "json"

DB_FILE_NAME="./application_db.json"

def get_db()
    begin
        db_file = File.read(DB_FILE_NAME)
        db = JSON.parse(db_file)
        return db
    rescue => exception
        puts(DB_FILE_NAME)
        puts(exception)
        exit()
    end
end

def write_to_db_file(db)
    begin
        File.write(DB_FILE_NAME,JSON.dump(db))
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





