
n = gets.chomp.to_i
arr = gets.chomp.split(" ")
arr.map!{|a| a.to_i}
arr.map! {|a| a%10}
arr=arr.join("").to_i
if arr%10==0
    print("Yes")
else
    print("No")
end