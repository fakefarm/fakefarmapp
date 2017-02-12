require "test_helper"

describe VersesController do
  let(:verse) { verses :one }

  it "gets index" do
    get verses_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_verse_url
    value(response).must_be :success?
  end

  it "creates verse" do
    expect {
      post verses_url, params: { verse: { book: verse.book, chapter: verse.chapter, translation: verse.translation, verse: verse.verse } }
    }.must_change "Verse.count"

    must_redirect_to verse_path(Verse.last)
  end

  it "shows verse" do
    get verse_url(verse)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_verse_url(verse)
    value(response).must_be :success?
  end

  it "updates verse" do
    patch verse_url(verse), params: { verse: { book: verse.book, chapter: verse.chapter, translation: verse.translation, verse: verse.verse } }
    must_redirect_to verse_path(verse)
  end

  it "destroys verse" do
    expect {
      delete verse_url(verse)
    }.must_change "Verse.count", -1

    must_redirect_to verses_path
  end
end
