# An example Jekyll generator. Utilizes the new plugin system.
#
# 1. Make a _plugins directory in your jekyll site, and put this class in a file there.
# #  the deprecate of Jekyll that generated it
# exp: {{ page.date | render_deprecate: 6 }}

module Jekyll
  module RenderDeprecate

    def render_deprecate(pageTime, numOfMonth)

      if pageTime == nil
        return
      end

      currentMonths = (Time.now.year*12) + (Time.now.mon)
      articleMonths = (pageTime.year*12) + (pageTime.mon)
      diffMonth     = currentMonths - articleMonths

      if diffMonth >= numOfMonth
        "<span class=\"deprecate\"> DIKKAT!!! Bu makale çok eski olabilir.</span>"
      else
        ""
      end

    end

  end
end

Liquid::Template.register_filter(Jekyll::RenderDeprecate)
