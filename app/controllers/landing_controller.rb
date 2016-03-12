class LandingController < ApplicationController
    
    def index
        if current_user != nil
            redirect_to home_path
        end
    end
    
end
