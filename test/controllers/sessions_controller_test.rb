require "test_helper"

describe SessionsController do
  it "should get new" do
    get login_path
    value(response).must_be :success?
  end

end
