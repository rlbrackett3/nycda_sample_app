CarrierWave.configure do |config|

  # In production, use S3 through Fog
  # In development, use filesystem and processing
  # In testing, use filesystem and no processing

  # To use S3 CNAME, set bucket name to the CNAME:
  # photos.example.com
  # Set s3_cnamed to true.
  # Set CNAME on your DNS:
  # cdn.example.com => cdn.example.com.s3.amazonaws.com

  config.cache_dir = "#{Rails.root}/tmp/uploads"

  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      # Configuration for Amazon S3 should be made available through an Environment variable.
      # For local installations, export the env variable through the shell OR
      # if using Passenger, set an Apache environment variable.
      #
      # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
      #
      # $ heroku config:add S3_KEY=your_s3_access_key
      # $ heroku config:add S3_SECRET=your_s3_secret
      # $ heroku config:add S3_REGION=eu-east-1
      # $ heroku config:add S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

      # Configuration for Amazon S3
      provider:                 'AWS',                        # required
      aws_access_key_id:        ENV['S3_KEY'],                # required
      aws_secret_access_key:    ENV['S3_SECRET'],             # required
      region:                   ENV['S3_REGION']              # optional, defaults to 'us-east-1'
      # host:                   's3.example.com',             # optional, defaults to nil
      # endpoint:               'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  =     ENV['S3_BUCKET']                        # required
    config.fog_public     =     false                                   # optional, defaults to true
    config.fog_attributes =     {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  elsif Rails.env.development?
    config.storage =            :file
  else
    config.storage =            :file
    config.enable_processing =  false
  end
end