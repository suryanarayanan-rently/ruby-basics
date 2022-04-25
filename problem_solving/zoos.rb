input = gets.chomp
input_len = input.length
z_len = 0
input.split("").each  do |char|
    if char != "z"
        break
    else
        z_len+=1
    end
end

if z_len * 2 == input_len - z_len
    print "Yes"
else
    print "No"
end 
