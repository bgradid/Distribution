class HomeController < ApplicationController
  def index
  @currentstatus = false
  if @currentstatus == true then
	@currentstatus = "Blah"
	end
  end

end
