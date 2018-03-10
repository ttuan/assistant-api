class ComicRegisterService
  attr_reader :comic_name, :current_user

  def initialize comic_name, current_user
    @comic_name = comic_name
    @current_user = current_user
  end

  def perform
    # TODO
    # 1. Search comic with name
    # 2. Insert info to database
  end
end
