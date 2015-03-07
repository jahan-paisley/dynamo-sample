require 'test_helper'

class DynamoSingleItemSaveAndGetTest < ActionDispatch::IntegrationTest
  test "fetched and saved for simple objects works" do
    post= Post.new
    post.id= 1
    post.title= "sample title 1"
    post.publish_date = DateTime.now
    post.save

    post1= Post.find(1)

    assert_equal post1, post
  end
end
