class Chatwork::WebhooksController < ApplicationController
  def create
    @message_info = ::Chatwork::SanitizeHelper.new(params).excute

    # TODO Send it to API.AI
    Chatwork::Speaker.new(@message_info[:room_id], @message_info[:sender_id], "It's work").speak
  end
end
