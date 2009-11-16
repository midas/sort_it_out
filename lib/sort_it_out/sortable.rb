module SortItOut
  module Sortable
   
    def self.included( base )
      base.extend( ActMethods )
    end

    module ActMethods
      def sortable( options={} )
        unless included_modules.include? InstanceMethods
          include InstanceMethods
          before_filter :resolve_sort
          class_inheritable_accessor :options
        end

        self.options = options
      end
    end

    module InstanceMethods
      def resolve_sort
        order = params[:order]
        order = params[:order] = self.options[:default] unless order
        params[:direction] = 'ASC' unless params[:direction]
        @order = order.nil? ? "" : resolve_order_clause( order, params[:direction] )
      end

      protected

      def resolve_order_clause( order, dir="ASC" )
        translated = self.options[:map][order.to_sym]
        order = translated unless translated.nil?
        return order.is_a?( Array ) ? order.map { |field| "#{field} #{dir}" }.join( ", " ) : "#{order} #{dir}"
      end
    end
     
  end
end