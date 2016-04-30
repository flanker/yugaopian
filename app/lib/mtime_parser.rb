require 'rest-client'
require 'json'

class MtimeParser

  GET_VIDEO_API = 'http://api.mtime.com/trailer/getvideo.aspx?vid='

  def initialize video_id
    @video_id = video_id
  end

  def video_url
    response = RestClient.get "#{GET_VIDEO_API}#{@video_id}"
    JSON.parse(response.force_encoding(Encoding::UTF_8))['mp4']
  end

end
