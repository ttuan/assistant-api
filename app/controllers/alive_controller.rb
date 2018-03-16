class AliveController < ApplicationController
  def show
    render status: 200, plain: "It's work"
  end
end
