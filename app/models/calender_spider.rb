class CalenderSpider < Kimurai::Base
    @name = 'calender_spider'
    @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url , data = {})
    hash_array = {}
    i = 0
    j = 1
    response.css("div.teaser-search__content").each do |inner_details|
      hash_array[:title] = inner_details.css("h2").text.squish
      hash_array[:bar] = inner_details.css("h2").text.squish
      hash_array[:teaser] = inner_details.css("div.teaser-search__text").text.squish           
      hash_array[:day] = response.css("span.nopr")[i].text.squish rescue nil
      hash_array[:date] = response.css("span.nopr")[i].text.squish rescue nil
      hash_array[:websource] = "visitevent"
      i = i + 1
      j = j + 2
      Event.where(hash_array).first_or_create
    end 
  end
end
