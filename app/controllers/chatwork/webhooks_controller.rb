class Chatwork::WebhooksController < ApplicationController

  def create
    message = ClassificationService.new(dialog_response[:result], current_user).perform

    Chatwork::Speaker
      .new(cw_message[:room_id], cw_message[:sender_id], message).speak
  end

  private
  def cw_message
    @cw_message ||= Chatwork::SanitizeHelper.new(params["webhook_event"]).excute
  end

  def dialog_response
    @dialog_response ||= Dialogflow::PostMan.new(cw_message[:body]).perform
  end

  def current_user
    @current_user ||= User.find_by provider: "chatwork", uid: cw_message[:sender_id]
  end
end
