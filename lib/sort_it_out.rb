require "sort_it_out/version"
require 'sort_it_out/railtie' if /3\.\d+\.\d+.*/.match( Rails.version )

module SortItOut

  autoload :Sortable, 'sort_it_out/sortable'

end

if /2\.\d+\.\d+.*/.match( Rails.version )
  ActionController::Base.send( :include, SortItOut::Sortable ) if defined?( ActionController::Base )
end
