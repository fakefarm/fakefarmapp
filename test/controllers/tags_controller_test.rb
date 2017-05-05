require "test_helper"

describe TagsController do
  let(:tag) { tags :one }

  it "gets index" do
    get tags_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_tag_url
    value(response).must_be :success?
  end

  it "creates tag" do
    expect {
      post tags_url, params: { tag: { body: tag.body, title: tag.title } }
    }.must_change "Tag.count"

    must_redirect_to tag_path(Tag.last)
  end

  it "shows tag" do
    get tag_url(tag)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_tag_url(tag)
    value(response).must_be :success?
  end

  it "updates tag" do
    patch tag_url(tag), params: { tag: { body: tag.body, title: tag.title } }
    must_redirect_to tag_path(tag)
  end

  it "destroys tag" do
    expect {
      delete tag_url(tag)
    }.must_change "Tag.count", -1

    must_redirect_to tags_path
  end
end
