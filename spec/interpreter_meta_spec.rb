require 'spec_helper'
require_relative '../interpreter_meta'

RSpec.describe BF93Interpreter::BF93_Interpreter do
    context "confirming initializations" do
        let(:int) {BF93Interpreter::BF93_Interpreter.new}
        it "ensures that the stack is empty" do
            expect(int.stack).to eq []
        end
    end

    context "Methods exist for pushing digits to the stack" do
        let(:int) {BF93Interpreter::BF93_Interpreter.new}
        it "Ensures all 10 digit methods exist" do
            (0..9).each do |digit|
                expect(int.respond_to?("bf_#{digit}")).to be true
            end
        end

        it "Ensures the 10 digit methods add digits to the stack" do
            (0..9).each do |digit|
                int.public_send("bf_#{digit}")
                expect(int.stack.include?(digit)).to be true
            end
        end
    end

    context "Mathematical functions" do
        let(:int){ BF93Interpreter::BF93_Interpreter.new }
        
        it "Sums the 2 top values on the stack" do
            (0..2).each do |d|
                int.public_send("bf_#{d}")
            end
            int.public_send(:+)
            expect(int.top).to eq(3)
        end

        it "Gets the difference of the 2 top values on the stack" do
            (0..2).each do |d|
                int.public_send("bf_#{d}")
            end
            int.public_send(:-)
            expect(int.top).to eq(1)
        end

        it "Multiplies the 2 top values on the stack" do
            (0..3).each do |d|
                int.public_send("bf_#{d}")
            end
            int.public_send(:*)
            expect(int.top).to eq(6)
        end

        it "Divides the 2 top values in the stack" do
            int.bf_1
            int.bf_2
            int.public_send(:/)
            expect(int.top).to eq(2)
        end

        it "return 0 for div/0" do
            int.bf_0
            int.bf_2
            int.public_send(:/)
            expect(int.top).to eq(0)
        end

        it "Gets the modulo of the 2 top values in the stack" do
            int.bf_3
            int.bf_2
            int.public_send(:%)
            expect(int.top).to eq(2)
        end

        it "Returns 0 for modulo when a is 0" do
            int.bf_0
            int.bf_2
            int.public_send(:%)
            expect(int.top).to eq(0)
        end

        it "Negates the top value in the stack" do
            int.bf_0
            int.public_send(:bf_!)
            expect(int.top).to eq(1)

            int.public_send(:bf_!)
            expect(int.top).to eq(0)
        end

        it "returns true if top is greater than bottom" do
            int.bf_0
            int.bf_1
            int.public_send(:`)
            expect(int.top).to eq(1)

            int.bf_0
            int.public_send(:`)
            expect(int.top).to eq(0)
        end

    end
end