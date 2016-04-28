require 'aws-sdk'

Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new("AKIAJDJY4V3QGDVGH2WQ", "qlBHA1dDU4N80kd7fkb52MEguabwT9sbVdiwht91"),
})

S3_BUCKET = Aws::S3::Resource.new.bucket("cds-prof")