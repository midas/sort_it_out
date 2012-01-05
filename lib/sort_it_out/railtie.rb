require 'rails'

module SortItOut

  class Railtie < ::Rails::Railtie

    initializer "sort_it_out.initialize" do
      ActionController::Base.send :include, SortItOut::Sortable
    end

  end

end
