class BerlinSpider < Kimurai::Base
    @name = 'berlin_spider'
    @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url , data = {})
    hash_array = {}
    response.css('.block').each do |inner_tag|
      next if (inner_tag.css('h2').text.squish).empty?
      hash_array[:title] = inner_tag.css('h2').text.squish
      hash_array[:bar] = inner_tag.css('h3').text.squish
      hash_array[:teaser] = inner_tag.css('h4').text.squish
      date_details = inner_tag.css("p").text.squish
      date_details = date_details.split(" ")
      hash_array[:day] = date_details[0]
      hash_array[:date] = date_details[1]
      hash_array[:start_time] = date_details[3]
      hash_array[:websource] = "berlinevent"
      Event.where(hash_array).first_or_create
    end
  end
end
