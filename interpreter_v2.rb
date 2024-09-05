module Interpreter
    class Interpreter
        attr_accessor :stack
        
        def initialize
            stack = []
        end

        def add(a,b)
            this.stack.push( this.stack.pop + this.stack.pop )
        end

        def subtract
            this.stack.push( this.stack.pop - this.stack.pop )
        end

        def multiply
            this.stack.push( this.stack.pop * this.stack.pop )
        end

        def divide
            if this.stack[-2] == 0
                this.stack = this.stack[0..-3]
                this.stack.push(0)
            else
                this.stack.push(this.stack.pop / this.stack.pop )
            end
        end

        def modulo
            if this.stack[-2] == 0 ? 
                this.stack = this.stack[0..-3]
                this.stack.push(0) 
            else
                this.stack.push(this.stack.pop % this.stack.pop )
            end
        end

        def negate
            if this.stack[-1] == 0
                this.stack.push(1)
            else
                this.stack.pop
                this.stack.push(0)
            end
        end

        def greater_than
            if this.stack[-2] > this.stack[-1]
                this.stack = this.stack[0..-3]
                this.stack.push(1)
            else
                this.stack = this.stack[0..-3]
                this.stack.push(0)
            end
        end

        def pop_and_check
            this.stack.pop == 0 ? ["right","down"] : ["left", "up"]
        end

        def push_string(str)
            this.stack.push(str)
        end

        def duplicate_top
            this.stack.empty? ? this.stack.push : this.stack.push(this.stack[-1])
        end

        def swap_values
            [a,b] = this.stack[-2..-1]
            this.stack = this.stack[0..-3] 
            this.stack.push(*[a,b].reverse)
        end

        def pop_and_discard
            this.stack.pop
        end

        def pop_as_int
            this.stack.pop
        end
    end
end