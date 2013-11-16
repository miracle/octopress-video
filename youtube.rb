class YouTube < Liquid::Tag
Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

def initialize(tagName, markup, tokens)
  super

  @params = markup.split(" ")
  if @params.count >= 1
    @id = @params[0]
    if @params.count >= 3
      @width = @params[1]
      @height = @params[2]
    else
      @width = 560
      @height = 420
    end
  else
    raise "No YouTube ID provided in the \"youtube\" tag"
  end
end    

def render(context)
# "<iframe width=\"#{@width}\" height=\"#{@height}\" src=\"http://www.youtube.com/embed/#{@id}\" frameborder=\"0\"allowfullscreen></iframe>"
"<iframe width=\"#{@width}\" height=\"#{@height}\" src=\"http://www.youtube.com/embed/#{@id}?color=white&theme=light\"></iframe>"
end

Liquid::Template.register_tag "youtube", self
end
