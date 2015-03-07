require 'test_helper'

class DynamoSingleItemSaveAndGet < ActionDispatch::IntegrationTest
  test "DynamoDbLocal is working fine" do
    post= Post.new
    post.id= 1
    post.title= "sample title 1"
    post.publish_date = DateTime.now
    post.save

    post1= Post.find(1)
    # binding.pry


    assert post1 == post
  end
end
