require 'test_helper'

class TagPolicyTest < ActiveSupport::TestCase

  before do
    @user = users(:oscar)
  end

  describe "for an user" do
    it { assert_permit @user, Tag, :index }
    it { assert_permit @user, Tag, :new }
    it { assert_permit @user, Tag, :show }
    it { assert_permit @user, Tag, :create }
    it { assert_permit @user, Tag, :edit }
    it { assert_permit @user, Tag, :update }
    it { assert_permit @user, Tag, :destroy }
  end
end
