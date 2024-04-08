module Songs
  class Tag < ActiveInteraction::Base
    string :path
    
    def execute
      binding.pry
    end
  end
end
