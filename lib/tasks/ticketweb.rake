namespace :ticketweb do
  desc "Either creates or updates values in the database from the ticketweb api"
  task :load => :environment do
  	count = 1

    repeat_every(5) do
      puts "Loading ticketweb data page #{count}"
      unless load_ticketweb_page(count)
        puts "No more data, or something went wrong! Halting..." 
      	break
      end
      count += 1
    end
  end

  def load_ticketweb_page(number)
  	false
  end

  def repeat_every(seconds)
  	loop do
  	  start_time = Time.now
	  yield
	  elapsed = Time.now - start_time
	  sleep([seconds - elapsed, 0].max)
	end
  end
end