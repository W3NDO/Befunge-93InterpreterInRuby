require 'spec_helper'
require_relative '../main' 

RSpec.describe Main do
    context "#get_file" do 
        let(:main_class) {Main.new}
        it "gets file path from the command line options" do
            expect(main_class.get_file).to receive("./test/test.bf")
        end

        xit "opens the file at the file path that is passed"
    end
end