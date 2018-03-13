class ClassificationService
  attr_reader :response, :current_user

  def initialize response, current_user
    @response = response
    @current_user = current_user
  end

  def perform
    if service.present?
      message = service.new(response[:parameters], current_user).perform
    end

    message || response[:fulfillment][:speech]
  end

  private
  def service
    full_name = response[:action].split("__")
    namespace = full_name[0]
    action = full_name[1]
    service = "#{namespace.try :camelize}::#{action.try :camelize}Service".safe_constantize
  end
end
