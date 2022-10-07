# code by W3NDO
require './stack'
class Interpreter

    attr_accessor :stack
    
    def initialize
        self.stack = Stack.new
    end

    def traverse_field(direction, current_position, array) # returns new position
        # it is a 2D array, hence length of the first object would be the width of the 2D plane and length of the entire array would be the height of the 2D stack
        # current_position will be an array with 2 elements, each an index of the array
        # current_position == [x, y] coordinate system
        width = array[0].length-1
        height = array.length-1
        string_mode = false

        case direction
        when ">"
            if current_position[0] == width and current_position[1] == height
                current_position 
            elsif current_position[0] == width
                current_position[1] += 1
                current_position[0] = 0
                current_position
            else
                current_position[0] += 1
                current_position
            end
        when "<"
            if current_position[0] == 0 and current_position[1] == 0
                current_position 
            elsif current_position[0] == 0
                current_position[1] -= 1
                current_position[0] = width
                current_position
            else
                current_position[0] -= 1
                current_position
            end
        when "^"
            if current_position[0] == 0 and current_position[1] == 0
                return current_position
            elsif current_position[1] == 0
                current_position[0] -= 1
                current_position[1] = height
                current_position
            else
                current_position[1] -= 1
                current_position
            end
        when "v"
            if current_position[0] == width and current_position[1] == height
                return current_position
            elsif current_position[1] == height
                current_position[0] += 1
                current_position[1] = 0
                current_position
            else
                current_position[1] += 1
                current_position
            end
        when "?" 
            traverse_field([">", "<", "^", "v"].sample, current_position, array) # call a random traversal direction
        when "#"
            if current_position[0] == width and current_position[1] == height
                current_position 
            elsif current_position[0] == width # line wrap
                current_position[1] += 1
                current_position[0] = 1
                current_position
            else
                temp = current_position[0]+2
                diff = temp - width -1
                if temp > width
                    current_position[1] += 1
                    current_position[0] = diff
                else
                    current_position[0]+=2
                end
                current_position
            end
        when " "
            traverse_field(">", current_position, array)
        # when "@"
        when "\""
            string_mode = !string_mode
            traverse_field(">", current_position, array)

        end
        # pop, move right or left ( _ )
        # pop, move up or down ( | )
        # End program ( @ )
        # a put call ( p )
        # a get call ( g )

    end
end

# sample_input = [
#     [>,9,8,7,v,>,.,v],
#     [v,4,5,6,<, , ,:,],
#     [>,3,2,1, ,^, ,_,@]
# ]