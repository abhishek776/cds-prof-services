require 'aws-sdk'

Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new("AKIAIMHLKR7CSHFL4JLA", "LL8oOTbcy6MZGS0DhvaUeheqLRYgk+KBpSDD8AqI"),
})

S3_BUCKET = Aws::S3::Resource.new.bucket("cds-prof")