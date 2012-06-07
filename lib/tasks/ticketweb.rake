require 'ticketweb_api.rb'

namespace :ticketweb do
  include TicketWebAPI

  desc "Either creates or updates values in the database from the ticketweb api"
  
  task :load => :environment do
    failure_count = 0
    page_num = 1

    repeat_every(10) do
      puts "Loading ticketweb data page #{page_num}"

      if not TicketWebAPI.get_page(page_num.to_s)
        if failure_count < 10 
          puts "No more data, or something went wrong! Skipping page..." 
          failure_count += 1
        else
          puts "Too many failures... Parsing stopped."
        end
      end

      page_num += 1
    end
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