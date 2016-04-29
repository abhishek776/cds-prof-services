require 'aws-sdk'

Aws.config.update({
  region: 'us-east-1'
})

S3_BUCKET = Aws::S3::Resource.new.bucket("cds-prof")