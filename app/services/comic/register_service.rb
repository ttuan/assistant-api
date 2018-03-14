class Comic::RegisterService
  attr_reader :comic_names, :current_user

  def initialize comic_names, current_user
    @comic_names = comic_names[:name]
    @current_user = current_user
  end

  def perform
    comic_names.each do |comic_name|
      info = comic_info comic_name
      if info
        comic = Comic.find_or_create_by info
        current_user.user_comics.find_or_create_by comic_id: comic.id
      else
        return Dialogflow::PostMan.new("register_fail #{comic_name}")
          .perform[:result][:fulfillment][:speech]
      end
    end
    return
  end

  private
  def comic_info comic_name
    agent = Mechanize.new
    sanitized_name = comic_name.sub(' ', '+')
    page = agent.get "#{Settings.comic.base_url}?s=#{sanitized_name}&q=#{sanitized_name}"
    if page.search(".update_item").present?
      comic = page.search(".update_item").first.search("a").first
      name, url = comic.attr("title"), comic.attr("href")
      {name: name, url: url} if nice_result?(name, comic_name)
    end
  end

  def nice_result? name, comic_name
    name.downcase.sub("-", " ").include?(comic_name.downcase)
  end
end
