module BF93Interpreter
    class BF93_Interpreter
        attr_accessor :stack 

        def initialize
            self.stack = []
        end

        def top
            self.stack[-1]
        end

        def self.define_bf_digit(digit)
            define_method("bf_#{digit}") do
                self.stack.push(digit)
            end
        end

        (0..9).each do |digit|
            define_bf_digit(digit)
        end

        def +
            self.stack.push( self.stack.pop + self.stack.pop )
        end

        def -
            self.stack.push( self.stack.pop - self.stack.pop )
        end

        def *
            self.stack.push( self.stack.pop * self.stack.pop )
        end

        def /
            if self.stack[-2] == 0 
                self.stack = self.stack[0..-3]
                self.stack.push(0)
            else
                self.stack.push( self.stack.pop / self.stack.pop )
            end
        end

        def %
            if self.stack[-2] == 0 
                self.stack = self.stack[0..-3]
                self.stack.push(0)
            else
                self.stack.push( self.stack.pop % self.stack.pop )
            end
        end

        def bf_!
            if self.top == 0
                self.stack.pop
                self.stack.push(1)
            else
                self.stack.pop
                self.stack.push(0)
            end
        end

        def `
            b,a = self.stack.pop, self.stack.pop
            b > a ? self.stack.push(1) : self.stack.push(0)
        end

    end
end