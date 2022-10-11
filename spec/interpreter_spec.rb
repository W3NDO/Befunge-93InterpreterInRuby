require 'spec_helper'
require_relative '../interpreter'
require_relative '../stack'

RSpec.describe Interpreter do

    context "confirming initializations" do
        let(:int) {Interpreter.new}
        it "ensures that current position is initialized to 0,0" do
            expect(int.current_position).to eq [0,0]
        end

        it "has a stack with stack methods available to it." do
            expect(int.stack.top).to eq nil
            int.stack.push_2_stack(2)
            expect(int.stack.size).to eq 1
        end

    end

    context "testing Traversal" do
        let(:int) {Interpreter.new}
        let(:test_field) { [ [1,2,3], [4,5,6], [7,8,9] ] }

        it "moves one step top the right" do
            expect(int.stack.size)
            int.traverse_field(">", [0,0], test_field)
            pp int.read_cell(int.current_position, test_field)
            
        end

        it "moves one step to the left" do
            int.traverse_field("<", [2,2], test_field)
            expect(int.current_position).to eq [1,2]
        end

        it "moves one step up" do
            int.traverse_field("^", [1,2], test_field)
            expect(int.current_position).to eq [1,1]
        end

        it "moves one step down" do
            int.traverse_field("v", [1,1], test_field)
            expect(int.current_position).to eq [1,2]
        end
        
        it "wraps down one line if it has reached the field width" do
            int.traverse_field(">", [2,0], test_field)
            expect(int.current_position).to eq [0,1]
        end

        it "wraps up one line if you try to move left and it is at the beginning of the line" do
            int.traverse_field("<", [0,1], test_field)
            expect(int.current_position).to eq [2,0]
        end

        it "wraps to the next column if you move down when it is at the field height" do
            int.traverse_field("v", [0,2], test_field)
            expect(int.current_position).to eq [1,0]
        end

        it "wraps to the previous column if you move up when it is at height 0" do
            int.traverse_field("^", [1,0], test_field)
            expect(int.current_position).to eq [0,2]
        end

        it "returns current position if you can't move any further in provided direction" do
            int.traverse_field(">", [2,2], test_field)
            expect(int.current_position).to eq [2,2]
            int.traverse_field("v", [2,2], test_field)
            expect(int.current_position).to eq [2,2]
            int.traverse_field("<", [0,0], test_field)
            expect(int.current_position).to eq [0,0]
            int.traverse_field("^", [0,0], test_field)
            expect(int.current_position).to eq [0,0]
        end
         
        it "moves in a random cardinal direction." do # fix this
            # temp_res_1 = int.traverse_field("?", [2,2], test_field)
            # temp_res_2 = int.traverse_field("?", [0,2], test_field)
            # expect(temp_res_1 == temp_res_2).to be false
            #expect{ int.traverse_field("?", [2,2], test_field) }.to invoke(:traverse_field).on(int)

            expect(int).to receive(:traverse_field).and_call_original
            expect(int).to receive(:traverse_field).with([">", "<", "^", "v"].sample, int.current_position, test_field)
            int.traverse_field("?", [0,0], test_field)
        end

        it "skips next cell" do
            int.traverse_field("#", [0,2], test_field)
            expect(int.current_position).to eq [2,2]
            int.traverse_field("#", [1,1], test_field)
            expect(int.current_position).to eq [0,2]
            int.traverse_field("#", [2,1], test_field)
            expect(int.current_position).to eq [1,2]
        end

        it "does nothing (trigger a no-op)" do
            int.traverse_field(" ", [0,2], test_field)
            expect(int.current_position).to eq [1,2]
        end

        xit "triggers a put call" do
            stk.push_2_stack(2)
            stk.push_2_stack(3)
        end


        xit "triggers a get call"

        xit "ends program" 
    end

    context "#read_cell" do
        let(:int) {Interpreter.new}
        let(:test_field) { [ [">",9,8,7,"v",">",".","v"], ["v",4,5,6,"<", "", "",":",""], [">",3,2,1,"","^","" ,"_","@"] ] }
        it "pushes the value onto the stack if cell value is not a navigation proc" do
            int.read_cell(int.current_position, test_field)
            int.read_cell(int.current_position, test_field)
            expect(int.stack.top).to eq 9
        end

        it "navigates to the appropriate cell if the read cell value is a navigation proc" do
            int.current_position = [0,0]
            expect(int).to receive(:traverse_field).and_call_original
            expect(int).to receive(:traverse_field).with(9, [1,0], test_field)
            int.read_cell(int.current_position, test_field)
            
            # int.traverse_field(int.read_cell(int.current_position, test_field), int.current_position, test_field)
            # expect(int.current_position).to eq [1,0]

        end
    end

    context "#find_value" do 
        let(:int) {Interpreter.new}
        let(:test_field) { [ [1,2,3], [4,5,6], [7,8,9] ] }
        it "returns the value of the array at the position passed in the args" do
            expect(int.find_value([0,2], test_field)).to eq 3
        end
    end

end
# these tasks are getting harder by the day and I am not sure if I can actually finish them. But anyway
