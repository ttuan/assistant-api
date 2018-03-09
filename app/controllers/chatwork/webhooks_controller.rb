class Chatwork::WebhooksController < ApplicationController
  def create
    @message_info = ::Chatwork::SanitizeHelper.new(params).excute
    predicted_message = Dialogflow::PostMan.new(@message_info[:body]).predicted_message

    Chatwork::Speaker
      .new(@message_info[:room_id], @message_info[:sender_id], predicted_message).speak
  end
end
