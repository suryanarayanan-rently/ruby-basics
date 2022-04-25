require "set"
n = gets.chomp.to_i
a_arr = gets.chomp.split(" ")
b_arr = gets.chomp.split(" ")
a_arr.map!{|val|val.to_i}
b_arr.map!{|val|val.to_i}
flag = true
ans = 0
while a_arr.min > -1
    a = a_arr.min
    for i in 0...n
        if a_arr[i]!=a
            a_arr[i] = a_arr[i] - b_arr[i]
            ans+=1
        end
    end
    if Set.new(a_arr).length == 1
        flag=false
        print(ans)
        break
    end
end

if flag
    print(-1)
    end
