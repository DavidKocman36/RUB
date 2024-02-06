module Reporting

    def summary
        count = 0

        print "Tracker: #{@name}; issues:"

        [:low, :medium, :high].each {|par| 
            @issues_arr.each {|item| 
                count += 1 if item.priority == par
            }
            print " #{count} #{par}"
            print "," unless par == :low
            count = 0
        }

        print "\n"
    end
    
    def report_by(param)

        case param
            when :status
                [:new, :progress, :done].each {|par| 
                    print "#{par}: "
                    @issues_arr.each {|item| 
                        print "#{item.title} " if item.status == par
                    }
                    print "\n"
                }
            when :priority
                [:high, :medium, :low].each {|par| 
                    print "#{par}: "
                    @issues_arr.each {|item| 
                        print "#{item.title} " if item.priority == par
                    }
                    print "\n"
                }
            else
                raise "Incorrect parameter \"#{param}\"!"
        end
    end
end