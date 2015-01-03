# notice that Ruby will throw a NameError when it cannot find a class

class Friend
    def greeting(*friend)
        if friend.empty?
            "Hello!"
        else
            "Hello, #{friend[0]}!"
        end
    end
end
