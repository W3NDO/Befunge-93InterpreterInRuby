require 'spec_helper'
require_relative '../stack'

RSpec.describe Stack do
    context "Tests the basic functionality of the new array methods" do
        let(:stack) { Stack.new}
        it "creates a new Stack object" do
            expect(stack.class).to eq Stack
            expect(stack.stack.class).to eq Array
        end

        it "empties the stack" do
            stack.push_2_stack(2)
            stack.push_2_stack(3)
            stack.empty_stack
            expect(stack.top).to eq nil
        end

        it "returns the value at the top of the stack" do
            stack.push_2_stack("new element")
            expect(stack.top).to eq "new element"
        end

        it "pushes a new value on to the stack" do
            stack.push_2_stack("hello")
            expect(stack.top).to eq "hello"
        end

        it "pops a values from the stack" do
            # because tests may run randomly, we want this test to always re-initialize the stack
            stack.empty_stack
            expect(stack.pop_from_stack).to eq nil

            stack.push_2_stack("test")
            expect(stack.size).to eq 1
            expect(stack.pop_from_stack).to eq "test"
            expect(stack.size).to eq 0
        end

        it "adds the two top values of the stack" do
            2.times do 
                stack.push_2_stack(2)
            end
            stack.add_from_stack
            expect(stack.top).to eq 4
        end

        it "finds the difference of the two top values of the stack" do
            stack.push_2_stack(2)
            stack.push_2_stack(3)
            stack.subtract_from_stack
            expect(stack.top).to eq -1

            stack.push_2_stack(3)
            stack.push_2_stack(2)
            stack.subtract_from_stack
            expect(stack.top).to eq 1
        end

        it "finds the product of the two top values of the stack" do
            stack.push_2_stack(2)
            stack.push_2_stack(3)
            stack.multiply_from_stack
            expect(stack.top).to eq 6
        end

        it "divides the two top values on the stack" do
            stack.push_2_stack(4)
            stack.push_2_stack(2)
            stack.divide_on_stack
            expect(stack.top).to eq 2

            stack.push_2_stack(0)
            stack.push_2_stack(2)
            stack.divide_on_stack
            expect(stack.top).to eq 0
        end

        it "gets the modulo of the two top values on the stack" do
            stack.push_2_stack(0)
            stack.push_2_stack(2)
            stack.modulo_on_stack
            expect(stack.top).to eq 0

            stack.push_2_stack(5)
            stack.push_2_stack(2)
            stack.modulo_on_stack
            expect(stack.top).to eq 1
        end

        it "negates the top value of the stack" do
            stack.push_2_stack(3)
            stack.negate_on_stack
            expect(stack.top).to eq 0

            stack.push_2_stack(0)
            stack.negate_on_stack
            expect(stack.top).to eq 1
        end

        it "compares the two top values on the stack with a greater than" do
            stack.push_2_stack(2)
            stack.push_2_stack(3)
            stack.greater_than_on_stack # 2 > 3 ? false
            expect(stack.top).to eq 0

            stack.push_2_stack(3)
            stack.push_2_stack(3)
            stack.greater_than_on_stack # 3 > 3 ? false
            expect(stack.top).to eq 0

            stack.push_2_stack(4)
            stack.push_2_stack(3)
            stack.greater_than_on_stack # 4  > 3 ? true
            expect(stack.top).to eq 1
        end

        it  "duplicates a value on top of a stack or adds 0 if stack is empty" do
            stack.empty_stack
            stack.push_2_stack(2)
            stack.duplicate_top_value
            expect(stack.size).to eq 2
            
            stack.empty_stack
            stack.duplicate_top_value
            expect(stack.top).to eq 0
            expect(stack.size).to eq 1
        end

        it "swaps two values on top of stack, pretends there is an extra 0 at tthe bottom of the stack if there is only one value on the stack" do
            stack.empty_stack
            stack.push_2_stack(2)
            stack.swap_top_values
            expect(stack.size).to eq 2

            stack.empty_stack
            stack.push_2_stack(2)
            stack.push_2_stack(3)
            stack.swap_top_values
            expect(stack.size).to eq 2
            expect(stack.pop_from_stack).to eq 2
            expect(stack.pop_from_stack).to eq 3
        end

        it "pops from a stack and discards it" do
            stack.empty_stack
            stack.push_2_stack(2)
            stack.pop_and_discard
            expect(stack.size).to eq 0
        end

        it "triggers a put call" do
            stack.push_2_stack(2)
            stack.push_2_stack(3)
            stack.push_2_stack(5)
            expect(stack.put_call).to eq [3,5,2]
        end

        it "triggers a get call" do
            stack.push_2_stack(2)
            stack.push_2_stack(3)
            expect(stack.get_call).to eq [2,3]
        end

        xit "pops from stack and outputs the value as an intger"

        xit "pops from the stack and outputs the value as an ASCII char"
    end
end