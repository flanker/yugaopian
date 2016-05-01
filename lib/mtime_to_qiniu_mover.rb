require 'mtime_parser'
require 'http_downloader'
require 'qiniu_uploader'

class MtimeToQiniuMover

  attr_reader :video_id, :video_code, :video_file_name

  def initialize options
    @video_id = options[:video_id]
    @video_code = options[:video_code]
    @video_file_name = options[:video_file_name]
  end

  def run
    video_url = get_video_url
    download_video video_url
    upload_video
  end

  private

  def get_video_url
    puts 'Parsing video url from Mtime web page'
    parser = MtimeParser.new(video_id)
    url = parser.video_url
    puts 'Video url is: ' + url
    url
  end

  def download_video video_url
    puts 'Downloading video to local tmp storage'
    HttpDownloader.new(video_url, tmp_local_file_name).download
    puts 'Video downloaded'
  end

  def upload_video
    puts 'Uploading video to Qiniu cloud storage'
    uploader = QiniuUploader.new(qiniu_file_key, tmp_local_file_name)
    code, result, response_headers = uploader.upload
    puts 'Video uploaded'
  end

  def tmp_local_file_name
    "./tmp/#{video_code}.mp4"
  end

  def qiniu_file_key
    "#{video_code}/#{video_file_name}.mp4"
  end

end
