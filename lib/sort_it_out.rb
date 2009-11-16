$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'sort_it_out/sortable.rb'

module SortItOut
  VERSION = '0.9.2'
end

ActionController::Base.send( :include, SortItOut::Sortable ) if defined?( ActionController::Base )