# this class extends the finctionality of an Array to build a stack for befunge

class Stack
    attr_accessor :stack

    def initialize
        self.stack = Array.new
    end

    def empty_stack #removes all values in stack
        self.stack = Array.new
    end

    def top #return the top value of the stack
        self.stack.last
    end

    def size #return stack size
        self.stack.length
    end

    def push_2_stack(arg)
        self.stack.push(arg)
    end

    def pop_from_stack
        size == 0 ? nil : self.stack.pop
    end

    def add_from_stack
        first = self.stack.pop
        second = self.stack.pop
        self.stack.push first+second
    end

    def subtract_from_stack
        first = self.stack.pop
        second = self.stack.pop
        self.stack.push second-first
    end

    def multiply_from_stack
        first = self.stack.pop
        second = self.stack.pop
        self.stack.push first*second
    end

    def divide_on_stack
        first = self.stack.pop
        second = self.stack.pop
        first == 0 ? self.stack.push(0): self.stack.push((second/first).floor)
    end

    def modulo_on_stack
        first = self.stack.pop
        second = self.stack.pop
        first == 0 ? delf.push(0) : self.stack.push(second%first)
    end

    def negate_on_stack
        self.stack.pop == 0 ? self.stack.push(1) : self.stack.push(0)
    end

    def greater_than_on_stack # greater than is represented with a backtick(`)
        first = self.stack.pop
        second = self.stack.pop
        second > first ? self.stack.push(1) : self.stack.push(0)
    end

    def pop_and_discard
        self.stack.pop
    end

    def pop_and_output_as_int
        self.stack.pop
    end

    def swap_top_values
        first = self.stack.pop
        second = self.stack.pop || 0
        self.stack.push(first)
        self.stack.push(second)
    end

    def duplicate_top_value
        first = self.stack.pop || 0
        first == 0 ? self.stack.push(first) : 2.times{self.stack.push(first)}
    end

    def put_call # A "put" call (a way to store a value for later use). Pop y, x and v, then change the character at the position (x,y) in the program to the character with ASCII value v.
        y = self.stack.pop
        x = self.stack.pop
        v = self.stack.pop
        [x,y,v]
    end

    def get_call # g A "get" call (a way to retrieve data in storage). Pop y and x, then push ASCII value of the character at that position in the program.
        y = self.stack.pop
        x = self.stack.pop
        [x, y]
    end
end

