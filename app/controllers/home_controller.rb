class HomeController < ApplicationController

    def index
      @security = Security.new
      session[:logged_in] = nil
    end
end
