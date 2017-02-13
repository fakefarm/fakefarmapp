require 'nokogiri'
# page = Nokogiri::HTML(open(PAGE_URL))


# get bible verses to show through bible.com
# then, show them all from biblehub
# then, click on a translation and get the text from ... tbd

class Bible
  include HTTParty

  attr_reader :params, :http, :response

  def initialize(params, http=HTTParty)
    @params = params
    @http = http
  end

  def get
    @response = http.get(query)
  end

  def text # _dw probably a presenter
    response['reader_html']
  end

  def reference
    response['human']
  end

  def query
    base_url + "#{translation}/#{book}.#{chapter}.#{verse}.json"
  end

  def base_url
    "https://www.bible.com/bible/"
  end

  def book
    params['book'] # _dw add defaults
  end

  def chapter
    params['chapter']
  end

  def verse
    params['verse']
  end

  def translation
    params['translation']
    return '59'
  end
end
