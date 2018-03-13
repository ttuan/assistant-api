class Comic::ListService
  attr_reader :current_user

  def initialize _, current_user
    @current_user = current_user
  end

  def perform
    list = current_user.comics.pluck(:name).join(", ")
    return Dialogflow::PostMan.new("comic_list #{list}")
      .perform[:result][:fulfillment][:speech]
  end
end
