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
        unless order
          if self.options[:default].is_a?( String ) || self.options[:default].is_a?( Symbol )
            order = params[:order] = self.options[:default]
          elsif self.options[:default].is_a?( Hash )
            order = params[:order] = self.options[:default][:attribute]
            params[:direction] = self.options[:default][:direction]
          end
        end

        params[:direction] = 'ASC' unless params[:direction]
        @order = order.nil? ? "" : resolve_order_clause( order, params[:direction] )
      end

      protected

      def resolve_order_clause( order, dir="ASC" )
        translated = self.options[:map][order.to_sym] unless self.options[:map].nil?
        order = translated unless translated.nil?
        if order.is_a?( Array )
          return order.map { |field| "#{field} #{dir}" }.join( ", " )
        elsif order.is_a?( String ) && (order.include?( "," ) || order.include?( "ASC") || order.include?( "DESC" ))
          return order
        else order.is_a?( Symbol )
          return "#{order.to_s} #{dir}"
        end
      end
    end

  end
end