# Yugaopian

## Copy movie trailer from Mtime to Qiniu storage

Say if you want to copy trailer `http://video.mtime.com/59330/` (Captain America Civil War Chinese version trailer 3)

1. Set up environment variables of your Qiniu developer keys:

        export QINIU_BUCKET=YOUR_BUCKET
        export QINIU_ACCESS_KEY=YOUR_ACCESS_KEY
        export QINIU_SECRET_KEY=YOUR_SECRET_KEY

2. Get ready for the parameters:

    `video_id` is the number id from trailer url. Here it is `59330`.

    `video_code` will be the folder name in Qiniu bucket, and `video_file_name` will be the file name (ext name will be `mp4`). So the video object key in Qiniu will be `$video_code$/$video_file_name$.mp4`

    example:

        video_id: 59330,
        video_code: 'captain-america-civil-war',
        video_file_name: 'trailer-2-zh'

3. Run it in docker:

        docker-compose run rake move_trailer[59330,captain-america-civil-war,trailer-2-zh]

4. output:

        $ docker-compose run rake move_trailer[59330,captain-america-civil-war,trailer-2-zh]
        $ Parsing video url from Mtime web page
        $ Video url is: http://vfx.mtime.cn/Video/2016/04/12/mp4/160412151909044749.mp4
        $ Downloading video to local tmp storage
        $ Video downloaded
        $ Uploading video to Qiniu cloud storage
        $ Video uploaded

All the trailers' copyrights should belong to [Mtime](http://www.mtime.com/) and/or production companies.
