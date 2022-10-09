require 'spec_helper'
require_relative '../interpreter'
require_relative '../stack'

RSpec.describe Interpreter do
    context "testing Traversal" do
        let(:int) {Interpreter.new}
        let(:test_field) { [ [1,2,3], [4,5,6], [7,8,9] ] }

        it "has a stack with stack methods available to it." do
            expect(int.stack.top).to eq nil
            int.stack.push_2_stack(2)
            expect(int.stack.size).to eq 1
        end

        it "moves one step top the right" do
            expect(int.stack.size)
            expect(int.traverse_field(">", [0,0], test_field)).to eq [1,0]
        end

        it "moves one step to the left" do
            expect(int.traverse_field("<", [2,2], test_field)).to eq [1,2]
        end

        it "moves one step up" do
            expect(int.traverse_field("^", [1,2], test_field)).to eq [1,1]
        end

        it "moves one step down" do
            expect(int.traverse_field("v", [1,1], test_field)).to eq [1,2]
        end
        
        it "wraps down one line if it has reached the field width" do
            expect(int.traverse_field(">", [2,0], test_field)).to eq [0,1]
        end

        it "wraps up one line if you try to move left and it is at the beginning of the line" do
            expect(int.traverse_field("<", [0,1], test_field)).to eq [2,0]
        end

        it "wraps to the next column if you move down when it is at the field height" do
            expect(int.traverse_field("v", [0,2], test_field)).to eq [1,0]
        end

        it "wraps to the previous column if you move up when it is at height 0" do
            expect(int.traverse_field("^", [1,0], test_field)).to eq [0,2]
        end

        it "returns current position if you can't move any further in provided direction" do
            expect(int.traverse_field(">", [2,2], test_field)).to eq [2,2]
            expect(int.traverse_field("v", [2,2], test_field)).to eq [2,2]
            expect(int.traverse_field("<", [0,0], test_field)).to eq [0,0]
            expect(int.traverse_field("^", [0,0], test_field)).to eq [0,0]
        end
         
        xit "moves in a random cardinal direction." do # fix this
            # temp_res_1 = int.traverse_field("?", [2,2], test_field)
            # temp_res_2 = int.traverse_field("?", [0,2], test_field)
            # expect(temp_res_1 == temp_res_2).to be false
            expect{ int.traverse_field("?", [2,2], test_field) }.to invoke(:traverse_field).on(int)
        end

        it "skips next cell" do
            expect(int.traverse_field("#", [0,2], test_field)).to eq [2,2]
            expect(int.traverse_field("#", [1,1], test_field)).to eq [0,2]
            expect(int.traverse_field("#", [2,1], test_field)).to eq [1,2]
        end

        it "does nothing (trigger a no-op)" do
            expect(int.traverse_field(" ", [0,2], test_field)).to eq [1,2]
        end

        xit "triggers a put call" do
            stk.push_2_stack(2)
            stk.push_2_stack(3)
        end


        xit "triggers a get call"

        xit "ends program" 
    end

    context "#read_cell" do
        it "pushes the value onto the stack if "
    end

end