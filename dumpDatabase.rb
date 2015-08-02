

day = Time.new.day
puts "#{day}"
result = `echo #{day}`
status = $?.to_i

