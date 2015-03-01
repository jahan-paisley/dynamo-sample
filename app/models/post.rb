class Post
  include Dynamoid::Document

  table :name => :Posts, :key => :id, :read_capacity => 1, :write_capacity => 1
  field :title
  field :publish_date, :datetime
  # field :props, :
end
