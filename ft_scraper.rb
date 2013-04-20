require 'nokogiri'
require 'open-uri'

class FtScraper
  attr_reader :crossword_url, :crossword_page

  def initialize
    @crossword_url = 'http://www.ft.com/intl/life-arts/crossword'
    @crossword_page = Nokogiri::HTML(open(@crossword_url))
  end

  def most_recent_crossword_link
    crossword_page.css(
      '.linkList ul li a'
    ).first.attribute('href').value
  end
end
