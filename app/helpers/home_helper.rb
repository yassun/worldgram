module HomeHelper
  def wiki_for(name)
    wiki_url = "http://ja.wikipedia.org/wiki/#{name}"
    link_to("wiki", wiki_url, :target => '_blank')
  end
end
