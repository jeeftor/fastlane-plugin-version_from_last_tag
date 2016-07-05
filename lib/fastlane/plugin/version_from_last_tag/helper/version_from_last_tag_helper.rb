module Fastlane
  module Helper
    class VersionFromLastTagHelper
      # class methods that you define here become available in your action
      # as `Helper::VersionFromLastTagHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the version_from_last_tag plugin helper!")
      end
    end
  end
end
