# File Fixtures in Rails 5

In Rails 5, we can now organize such test files as fixtures.

Newly generated Rails 5 applications, will have directory `test/fixtures/files` to store such test files.

These test files can be accessed using file_fixture helper method in tests.

    require 'test_helper'

    class PostsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @post = posts(:one)
      end

      test "should get index" do
        get posts_url, format: :json

        assert_equal response.body, file_fixture('posts.json').read
      end
    end

The `file_fixture` method returns Pathname object, so it’s easy to extract file specific information.

    file_fixture('posts.json').read
    file_fixture('song.mp3').size

From:

http://blog.bigbinary.com/2016/03/02/use-file_fixture-to-access-test-files-rails-5.html
