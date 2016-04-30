require 'open-uri'

class HttpDownloader

  attr_reader :source, :target

  def initialize source, target
    @source = source
    @target = target
  end

  def download
    File.open(target, 'wb') do |saved_file|
      open(source, 'rb') do |read_file|
        saved_file.write(read_file.read)
      end
    end
  end

end
