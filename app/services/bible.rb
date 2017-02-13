require 'nokogiri'
# page = Nokogiri::HTML(open(PAGE_URL))
# get bible verses to show through bible.com
# then, show them all from biblehub
# then, click on a translation and get the text from ... tbd

# cases
# ReadBible # interactor
#   bible = ReadBible.new(params)
#   @bible = BiblePresenter(bible.content)
#   RequestBiblePassage # bible source
#   RequestByUrl # splice URL
#   RequestByForm # splice last verse
#   BibleProvider # specific content for bible.com / bible.hub
# BiblePresenter # @bible.text, @bible.chapter

class BibleProvider
  attr_reader :content
  def initialize(content)
    @content = content
  end

  def text # _dw probably a presenter
    content['reader_html']
  end

  def reference
    content['human']
  end
end

class RequestByUrl
  attr_reader :param

  def initialize(param)
    @param = param
  end

  def book
    param[0].scan( /[a-zA-Z]/).join('')
  end

  def chapter
    param[0].scan(/(\d+)/)[0][0]
  end

  def verse
    param[0].scan(/(\d+)/)[1][0]
  end

  def translation
    59
  end
end

class RequestByForm
  attr_reader :param

  def initialize(param)
    @param = param
  end

  def book
    param['book'] # _dw add defaults
  end

  def chapter
    param['chapter']
  end

  def verse
    param['verse']
  end

  def translation
    param['translation']
  end
end

class Bible
  include HTTParty

  attr_reader :params, :http, :response

  def initialize(params, http=HTTParty, last_verse = Verse.last)
    @last_verse = last_verse
    param_factory(params)
    @http = http
  end

  def param_factory(params)
    p = params.reject { |p| p == 'controller' || p == 'action' }

    if p.keys.present?
      @params = RequestByUrl.new(p.values)
    else
      @params = RequestByForm.new(@last_verse)
    end
  end

  def get
    @response = http.get(query)
  end

  def query
    base_url + "#{translation}/#{book}.#{chapter}.#{verse}.json"
  end

  def base_url
    "https://www.bible.com/bible/"
  end

  def book
    params.book
  end

  def chapter
    params.chapter
  end

  def verse
    params.verse
  end

  def translation
    params.translation
  end
end
