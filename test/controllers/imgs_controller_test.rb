require "test_helper"

describe ImgsController do
  let(:img) { imgs :one }

  it "gets index" do
    get imgs_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_img_url
    value(response).must_be :success?
  end

  it "creates img" do
    expect {
      post imgs_url, params: { img: { image_data: img.image_data } }
    }.must_change "Img.count"

    must_redirect_to img_path(Img.last)
  end

  it "shows img" do
    get img_url(img)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_img_url(img)
    value(response).must_be :success?
  end

  it "updates img" do
    patch img_url(img), params: { img: { image_data: img.image_data } }
    must_redirect_to img_path(img)
  end

  it "destroys img" do
    expect {
      delete img_url(img)
    }.must_change "Img.count", -1

    must_redirect_to imgs_path
  end
end
