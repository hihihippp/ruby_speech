require 'active_support/core_ext/class/attribute'

module RubySpeech
  module GRXML
    class Element < Niceogiri::XML::Node
      def self.namespace
        GRXML_NAMESPACE
      end

      def self.root_element
        Grammar
      end

      def self.module
        GRXML
      end

      alias_method :nokogiri_children, :children

      include GenericElement

      def regexp_content
        children.map { |e| "(#{e.regexp_content})" }
      end
    end # Element
  end # GRXML
end # RubySpeech
