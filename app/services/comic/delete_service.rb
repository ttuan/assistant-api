class Comic::DeleteService
  attr_reader :parameters, :current_user

  def initialize parameters, current_user
    @parameters = parameters
    @current_user = current_user
  end

  def perform
    parameters[:name].each do |comic_name|
      comic = Comic.find_by name: comic_name
      current_user.user_comics.find_by(comic_id: comic.id).try :destroy if comic
    end
    return
  end
end
