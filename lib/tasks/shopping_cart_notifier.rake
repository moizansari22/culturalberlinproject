require 'rake'
namespace :shopping_cart_notifier do
    task create_random: :environment do
      ScrapeRandomWebsiteJob.perform_later
    end
end