require 'test_helper'

class DynamoBatchGetTest < ActionDispatch::IntegrationTest
  test "batch get works fine" do
    post= Post.new
    post.id= 2
    post.title= "sample title 2"
    post.publish_date = DateTime.now
    post.save

    posts= Post.find([1,2,3])

    assert !posts.is_a? Enumerable
  end
end
