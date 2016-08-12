#  SoundCloud embed tag for Jekyll/Liquid
#
#  Usage:
#
#    {% soundcloud_sound 12345 %}
#    {% soundcloud_sound 12345 widgetname %}
#    {% soundcloud_sound 12345 widgetname ffffff %}
#    {% soundcloud_sound 12345 widgetname ffffff small %}
#
#    ... where 12345 is the SoundCloud sound ID, widgetname is the sound's visual
#    representation, ffffff is the color, and size is, well, the size (SoundCloud gives you
#    three options for the "artwork" widget).
#
#  Available SoundCloud widgets:
#
#    html5 (default)
#    flash *
#    mini *
#    artwork *
#
#    * Requires a paid SoundCloud tier
#
#  Author: Chris Nunciato (@cnunciato)
#  Source: http://github.com/cnunciato/jekyll-soundcloud

require 'shellwords'

module Jekyll
  class SoundCloudSoundTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
      params = Shellwords.shellwords markup
      @sound = { :id => params[0], :widget => params[1] || "html5", :color => params[2] || "ff7700", :size => params[3] || "medium" }
    end

    def render(context)
      case @sound[:widget]

      when "html5"
        "<iframe width=\"100%\" height=\"166\" scrolling=\"no\" frameborder=\"no\" src=\"http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F#{@sound[:id]}&show_artwork=true\"></iframe>"
      else
        ""
      end
    end

    private

      def dimension(size)
        case @sound[:size]

        when 'small'
          220
        when 'medium'
          300
        when 'large'
          425
        else
          0
        end
      end

  end

end

Liquid::Template.register_tag('soundcloud_sound', Jekyll::SoundCloudSoundTag)
