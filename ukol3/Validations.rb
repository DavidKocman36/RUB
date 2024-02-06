module Validations

    def add_issues(*issues)
        raise "Too many arguments! Maximum is 10, you have #{@issues_arr.length + issues.length}! " if @issues_arr.length + issues.length > 10
        
        issues.each { |item|
            raise "The parameter shall be an Issue class, not #{item.class}!" unless item.class == Issue
        }
    end 
end