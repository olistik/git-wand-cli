module GitWand
  module CLI
    module Utils

      def self.blank?(*list)
        list.all? do |value|
          value == nil || value == ""
        end
      end

      def self.present?(*list)
        list.all? do |value|
          value != nil && value != ""
        end
      end

    end
  end
end
