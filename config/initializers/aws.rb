require 'aws-sdk'

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