require 'test_helper'

class DynamoTestTest < ActionDispatch::IntegrationTest
  test "DynamoDbLocal is working fine" do
    binding.pry
    post= Post.new
    post.id= 1
    post.title= "sample title 1"
    post.publish_date = DateTime.now
    post.save

  end
end
