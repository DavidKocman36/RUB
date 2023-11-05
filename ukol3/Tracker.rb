require_relative "Issue.rb"
require_relative "Validations.rb"
require_relative "Reporting.rb"

class Tracker

    private
    @name
    @issues_arr

    public
    def initialize(name)
        @name = name
        @issues_arr = Array.new
    end

    include Validations
    def add_issues(*issues)
        super
        issues.each { |item|
            @issues_arr << item
        }
    end

    def issues_arr
        @issues_arr
    end

    include Comparable
    def <=>(other)
        result = []
        count_self = 0
        count_other = 0

        [:high, :medium, :low].each { |prio|
            count_self = self.issues_arr.count {|item| (item.status == :new || item.status == :progress) && item.priority == prio}
            count_other = other.issues_arr.count {|item| (item.status == :new || item.status == :progress) && item.priority == prio}

            result.push [count_self, count_other]
        }

        # 0->self, 1->other
        if result[0][0] != result[0][1]
            return result[0][0] <=> result[0][1]

        elsif result[1][0] != result[1][1]
            return result[1][0] <=> result[1][1]
        else
            return result[2][0] <=> result[2][1]
        end
    end

    include Reporting
end
