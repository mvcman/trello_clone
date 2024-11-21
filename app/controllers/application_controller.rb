class ApplicationController < ActionController::Base
    around_action :set_time_zone 

    private 

    def set_time_zone(&block)
        Time.use_zone('Kolkata', &block)
    end 
end
