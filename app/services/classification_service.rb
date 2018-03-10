class ClassificationService
  attr_reader :response, :current_user

  def initialize response, current_user
    @response = response
    @current_user = current_user
  end

  def perform
    unless (action = response[:action]).empty?
      "#{action.camelize}Service".safe_constantize.new(response[:parameters][:name], current_user).perform
    end
    response[:fulfillment][:speech]
  end
end
