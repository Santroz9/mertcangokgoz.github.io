# Syntax {% video url/to/video [width height] [url/to/poster] %}
#
# Example:
# {% video http://site.com/video.mp4 720 480 http://site.com/poster-frame.jpg %}
#

module Jekyll

  class VideoTag < Liquid::Tag
    @video = nil
    @poster = ''
    @height = ''
    @width = ''

    def initialize(tag_name, markup, tokens)
      @videos = markup.scan(/((https?:\/\/|\/)\S+\.(webm|ogv|mp4)\S*)/i).map(&:first).compact
      @poster = markup.scan(/((https?:\/\/|\/)\S+\.(png|gif|jpe?g)\S*)/i).map(&:first).compact.first
      @sizes  = markup.scan(/\s(\d\S+)/i).map(&:first).compact
      super
    end

    def render(context)
      output = super
      types = {
        '.mp4' => "type='video/mp4; codecs=\"avc1.42E01E, mp4a.40.2\"'",
        '.ogv' => "type='video/ogg; codecs=theora, vorbis'",
        '.webm' => "type='video/webm; codecs=vp8, vorbis'"
      }
      if @videos.size > 0
        video =  "<video #{sizes} preload='metadata' controls #{poster}>"
        @videos.each do |v|
          video << "<source src='#{v}' #{types[File.extname(v)]}>"
        end
        video += "</video>"
      else
        "Error processing input, expected syntax: {% video url/to/video [url/to/video] [url/to/video] [width height] [url/to/poster] %}"
      end
    end

    def poster
      "poster='#{@poster}'" if @poster
    end

    def sizes
      attrs = "width='#{@sizes[0]}'" if @sizes[0]
      attrs += " height='#{@sizes[1]}'" if @sizes[1]
      attrs
    end
  end
end

Liquid::Template.register_tag('video', Jekyll::VideoTag)
