module AWSS3Methods
  def load_s3
    begin
      require 'aws-sdk'
    rescue LoadError => e
      fail "You do not have aws-sdk installed."
    end
  end

  def assert_credentials(key, secret)
    load_s3
    begin
      aws_s3 = AWS::S3.new(
        :access_key_id => key,
        :secret_access_key => secret
      )
      aws_s3.buckets.first
    rescue AWS::S3::Errors::InvalidAccessKeyId => e
      fail "Could not connect using AWS credentials in AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY. " +
           "Please make sure these are set in your environment."
    end
  end
end

World(AWSS3Methods)
