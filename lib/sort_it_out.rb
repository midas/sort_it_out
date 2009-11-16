$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'sort_it_out/sortable.rb'

module SortItOut
  VERSION = '1.0.0'
end

ActionController.send( :include, SortItOut::Sortable ) if defined?( ActionController )