puts "Hi, please type your name: "
name = gets.chomp

def greeting(name)
    length = name.length
    cap_name = name.upcase

    p "Hi #{name}, it is nice having you back here!"
    p "I analyzed your name, your name have a length of #{length}"
    p "Here is your name in caps: #{cap_name}"
end

greeting(name)