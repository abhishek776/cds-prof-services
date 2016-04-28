require "paperclip/railtie"

Paperclip::Railtie.insert

Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-east-1.amazonaws.com'