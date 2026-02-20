require 'aws-sdk-s3'       # AWS SDK for interacting with Amazon S3
require 'pry'              # Pry for debugging (optional)
require 'securerandom'     # Used to generate random UUID values

# Read the S3 bucket name from environment variable BUCKET_NAME
bucket_name = ENV['BUCKET_NAME']

# Region to use for S3 operations
# NOTE: us-east-1 does NOT allow a location_constraint during bucket creation
region = 'us-east-1'

# Create an S3 client using credentials already configured on the machine
client = Aws::S3::Client.new(region: region)

# Create an S3 bucket
# In us-east-1, you must NOT specify create_bucket_configuration
resp = client.create_bucket(bucket: bucket_name)

# Choose a random number of files between 1 and 6
number_of_files = 1 + rand(6)
puts "number_of_files: #{number_of_files}"

# Loop once per file to create and upload them
number_of_files.times.each do |i|
  puts "i: #{i}"

  # Generate file name and temporary file path
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"

  # Create the file and write a UUID inside it
  File.open(output_path, "w") do |f|
    f.write SecureRandom.uuid
  end

  # Reopen the file in binary mode and upload to S3
  File.open(output_path, 'rb') do |f|
    client.put_object(
      bucket: bucket_name,  # Target S3 bucket
      key: filename,        # Object key in S3 (same as file name)
      body: f               # File contents
    )
  end
end
