require 'optparse'
require_relative './stack'
require_relative './interpreter'

class Main
    attr_accessor :cli_options

    def initialize
        self.cli_options = Hash.new
    end

    def get_file
        OptionParser.new do |option|
            option.on("-f FILEPATH", "--f FILEPATH", "FILEPATH is required for the befunge interpreter") do |opt|
                if opt =~ /.\.bf/
                    self.cli_options[:filepath] = opt
                end
            end
        end.parse!
    end

    def run
        bf_file = File.open(options[:filepath]).read
        p bf_file
    end
end

m = Main.new
m.get_file
m.run