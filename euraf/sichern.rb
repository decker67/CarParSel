
day = Time.new.day
puts "Create backup for day #{day}!"
result = `mysqldump -u root -padmin carparsel --result-file=dump_carparsel_#{day}.sql`
#status = $?.to_i

