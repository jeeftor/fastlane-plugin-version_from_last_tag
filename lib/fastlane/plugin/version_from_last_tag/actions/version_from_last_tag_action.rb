module Fastlane
  module Actions
    class VersionFromLastTagAction < Action
      def self.run(params)
        UI.message("The version_from_last_tag plugin is working!")
        version_to_return = "#{params[:default_version]}"
        regex = "#{params[:regex]}"

        # If there are remotes fetch tags
        remote_count = sh("git remote show | wc -l")
        puts "Detected #{remote_count}"
        puts remote_count.to_i > 0

        if remote_count.to_i > 0
          sh("git fetch --tags")
        else
          puts "Not fetching tags"
        end

        # Count the tags
        tag_count = sh("git show-ref --tags | wc -l")

        # If we have more than 1 tag try to parse
        if tag_count.to_i > 0
          last_tag = sh("git describe --tags `git rev-list --tags --max-count=1`")
          begin
            UI.message("Running [" + last_tag.chomp + "]")
            UI.message("With regex [" + regex + "]")
            result = /#{regex}/.match(last_tag.chomp)[1]
            if result != ""
              UI.message("Match")
              version_to_return = result
            else
              UI.message("No Match")
            end
          rescue
            UI.message("Regex Failure")
            # do nothing in the regex error case
          end
        end

        UI.message("Parsed tag #{version_to_return} 📝.".green)
        #Actions.lane_context[SharedValues::VERSION_FROM_LAST_TAG] = version_to_return

        return version_to_return
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
                                         default_value: "^\\D*([\\.0-9]*)",
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
