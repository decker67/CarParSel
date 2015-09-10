class StartController < ApplicationController

  def overview
    if mobile_device?
      redirect_to '/mobile/overview'
    end
  end

end
