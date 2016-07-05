module Fastlane
  module Actions
    class VersionFromLastTagAction < Action
      def self.run(params)
        UI.message("The version_from_last_tag plugin is working!")
      end

      def self.description
        "Perform a regex on last (latest) git tag and perform a regex to extract a version number such as Release 1.2.3"
      end

      def self.authors
        ["Jeff Stein"]
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "VERSION_FROM_LAST_TAG_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)


            FastlaneCore::ConfigItem.new(key: :regex,
                                         env_name: "FL_VERSION_FROM_LAST_TAG_REGEX",
                                         description: "Custom Regex for tag parsing ",
                                         optional: true,
                                         type: String, # true: verifies the input is a string, false: every kind of value
                                         default_value: "^\\D?([\\.0-9]*)",
                                         ),
            FastlaneCore::ConfigItem.new(key: :default_version,
                                         env_name: "FL_VERSION_FROM_LAST_TAG_DEFAULT_VERSION",
                                         description: "Default version if no tags can be found",
                                         type: String,
                                         default_value: "0.0.1",
                                         optional: true)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
