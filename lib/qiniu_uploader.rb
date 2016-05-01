require 'qiniu'

class QiniuUploader

  Qiniu.establish_connection! access_key: ENV.fetch('QINIU_ACCESS_KEY'),
                              secret_key: ENV.fetch('QINIU_SECRET_KEY')

  attr_reader :bucket, :key, :filepath

  def initialize key, filepath
    @bucket = ENV.fetch('QINIU_BUCKET')
    @key = key
    @filepath = filepath
  end

  def upload
    Qiniu::Storage.upload_with_token uptoken, filepath, bucket, key, 'video/mp4'
  end

  private

  def put_policy
    Qiniu::Auth::PutPolicy.new bucket, key, 3600
  end

  def uptoken
    Qiniu::Auth.generate_uptoken put_policy
  end

end
