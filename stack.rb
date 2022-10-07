# this class extends the finctionality of an Array to build a stack for befunge

class Stack
    attr_accessor :stack

    def initialize
        self.stack = Array.new
    end

    def push_2_stack(arg)
        self.push(arg)
    end

    def pop_from_stack
        self.pop
    end

    def add_from_stack
        first = self.pop
        second = self.pop
        self.push first+second
    end

    def subtract_from_stack
        first = self.pop
        second = self.pop
        self.push second-first
    end

    def multiply_from_stack
        first = self.pop
        second = self.pop
        self.push first*second
    end

    def divide_on_stack
        first = self.pop
        second = self.pop
        first == 0 ? self.push(0): self.push((second/first).floor)
    end

    def modulo_on_stack
        first = self.pop
        second = self.pop
        first == 0 ? delf.push(0) : self.push(b%a)
    end

    def negate_on_stack
        self.pop == 0 ? self.push(1) : self.push(0)
    end

    def greater_than_on_stack # greater than is represented with a backtick(`)
        first = self.pop
        second = self.pop
        second > first ? self.push(1) : self.push(0)
    end

    def pop_and_discard
        self.pop
    end

    def pop_and_output_as_int
        self.pop
    end

    def swap_top_values
        first = self.pop
        second = self.pop || 0
        self.push(second)
        self.push(first)
    end

    def duplicate_top_value
        first = self.pop || 0
        first == 0 ? self.push(first) : 2.times{self.push(first)}
    end

    def put_call # A "put" call (a way to store a value for later use). Pop y, x and v, then change the character at the position (x,y) in the program to the character with ASCII value v.
        y = self.pop
        x = self.pop
        v = self.pop
        return [x,y,v]
    end

    def get_call # g A "get" call (a way to retrieve data in storage). Pop y and x, then push ASCII value of the character at that position in the program.
        y = self.pop
        x = self.pop
        retrun [x, y]
    end
end

