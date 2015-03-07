require 'active_support/all'
require 'aws-sdk'
require 'dynamoid'

Aws.config[:region]= "us-east-1"
Aws.config[:credentials] = Aws::Credentials.new('AccessKeyId','SecretAccessKey')
Aws.config[:endpoint]= 'http://localhost:8000'


Dynamoid.configure do |config|
  config.endpoint = 'localhost:8000'
  config.adapter = 'aws_sdk' # This adapter establishes a connection to the DynamoDB servers using Amazon's own AWS gem.
  config.namespace = "dynamoid_app_development" # To namespace tables created by Dynamoid from other tables you might have.
  config.warn_on_scan = true # Output a warning to the logger when you perform a scan rather than a query on a table.
  config.partitioning = false # Spread writes randomly across the database. See "partitioning" below for more.
  config.partition_size = 200 # Determine the key space size that writes are randomly spread across.
  config.read_capacity = 1 # Read capacity for your tables
  config.write_capacity = 1 # Write capacity for your tables
end

post= Post.new
post.id= 1
post.title= "sample title 1"
post.publish_date = DateTime.now
post.save

# dynamodb = Aws::DynamoDB::Client.new
#
# binding.pry

# dynamodb.create_table(
#     # required
#     attribute_definitions: [
#         {
#             attribute_name: "KeySchemaAttributeName",
#             attribute_type: "N",
#         },
#         {
#             attribute_name: "NonKeySchemaAttributeName",
#             attribute_type: "N",
#         },
#     ],
#     table_name: "TableName1",
#     key_schema: [
#         {
#             attribute_name: "KeySchemaAttributeName",
#             key_type: "HASH",
#         },
#         {
#             attribute_name: "NonKeySchemaAttributeName",
#             key_type: "RANGE",
#         }
#     ],
#     global_secondary_indexes: [
#         {
#             index_name: "IndexName",
#             key_schema: [
#                 {
#                     attribute_name: "KeySchemaAttributeName",
#                     key_type: "HASH",
#                 },
#             ],
#             projection: {
#                 projection_type: "INCLUDE",
#                 non_key_attributes: ["NonKeyAttributeName"],
#             },
#             provisioned_throughput: {
#                 read_capacity_units: 1,
#                 write_capacity_units: 1,
#             },
#         },
#     ],
#     provisioned_throughput: {
#         read_capacity_units: 1,
#         write_capacity_units: 1,
#     },
# )

# class User
#   include Dynamoid::Document
#   table :name => :awesome_users, :key => :user_id, :read_capacity => 400, :write_capacity => 400
#
#   field :name
#   field :email
#   field :rank, :integer
#   field :number, :float
#   field :joined_at, :datetime
#   field :hash, :serialized
#
#   index :name
#   index :email
#   index [:name, :email]
#   index :created_at, :range => true
#   index :name, :range_key => :joined_at
#
# end
#
# u = User.new(:name => 'Josh')
# u.email = 'josh@joshsymonds.com'
# u.save