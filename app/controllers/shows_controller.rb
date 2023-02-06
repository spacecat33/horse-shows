class ShowsController < ApplicationController

    def summary
        "#{title} is a level #{level} #{discipline} event."
    end

end