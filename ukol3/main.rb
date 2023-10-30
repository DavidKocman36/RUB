#!/usr/bin/env/ruby
require_relative "Tracker.rb"

issue1 = Issue.new('high one', priority: :high)
issue2 = Issue.new('mid')
issue3 = Issue.new('lowbie', priority: :low, status: :done)

tracker = Tracker.new('My tracker')
tracker.add_issues(issue1, issue2, issue3)

tracker.summary
#=> Tracker My tracker: high: 1, medium: 1, low: 1
tracker.report_by(:priority)
#=> high: high one
#=> medium: mid
#=> low: lowbie

tracker2 = Tracker.new('Other tracker')
tracker2.add_issues(issue1, Issue.new('other high', priority: :high))

puts 'first is lower' if tracker < tracker2

tracker3 = Tracker.new('Third tracker')
done1 = Issue.new('done high 1', priority: :low)
done2 = Issue.new('done high 2', priority: :low)
done3 = Issue.new('done high 3', priority: :low)
done4 = Issue.new('done high 1', priority: :low)
done5 = Issue.new('done high 2', priority: :low)
done6 = Issue.new('done high 3', priority: :low)
done7 = Issue.new('done high 1', priority: :low)
done8 = Issue.new('done high 2', priority: :low)
done9 = Issue.new('done high 3', priority: :low)
tracker3.add_issues(done1, done2, done3, done4, done5, done6, done7, done8, done9)

puts tracker < tracker3

[tracker, tracker2, tracker3].sort # => [tracker3, tracker, tracker2] // ukázka pořadí, ne return hodnoty
puts [tracker, tracker2, tracker3].max