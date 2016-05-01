#!/usr/bin/env ruby

desc 'move trailer from mtime to qiniu'
task :move_trailer, [:video_id, :video_code, :video_file_name] do |_, args|
  require 'mtime_to_qiniu_mover'

  MtimeToQiniuMover.new(
    video_id: args[:video_id],
    video_code: args[:video_code],
    video_file_name: args[:video_file_name]
  ).run
end
