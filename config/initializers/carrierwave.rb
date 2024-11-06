# frozen_string_literal: true

require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if ENV.fetch('AWS_ACCESS_KEY_ID', nil)
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', nil),
      aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', nil),
      aws_session_token: ENV.fetch('AWS_SESSION_TOKEN', nil),
      region: ENV.fetch('AWS_S3_REGION', 'ap-southeast-2'),
      path_style: true
    }
    config.fog_directory = 'sample-s3-aws-practice-app'
    config.fog_use_ssl_for_aws = false
    config.fog_public = false
  else
    config.storage = :file
  end
end
