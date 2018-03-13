class ComicRegisterService
  attr_reader :comic_name, :current_user

  def initialize comic_name, current_user
    @comic_name = comic_name
    @current_user = current_user
  end

  def perform
    if comic_info
      comic = Comic.find_or_create_by comic_info
      current_user.user_comics.find_or_create_by comic_id: comic.id
      return
    else
      Dialogflow::PostMan.new("register_fail #{comic_name}")
        .perform[:result][:fulfillment][:speech]
    end
  end

  private
  def comic_info
    agent = Mechanize.new
    sanitized_name = comic_name.sub(' ', '+')
    page = agent.get "#{Settings.comic.base_url}?s=#{sanitized_name}&q=#{sanitized_name}"
    if page.search(".update_item").present?
      comic = page.search(".update_item").first.search("a").first
      name, url = comic.attr("title"), comic.attr("href")
      {name: name, url: url} if nice_result?(name)
    end
  end

  def nice_result? name
    name.downcase.include?(comic_name.downcase)
  end
end
