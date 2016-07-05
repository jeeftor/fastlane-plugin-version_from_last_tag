# version\_from\_last\_tag plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-version_from_last_tag)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-version_from_last_tag`, add it to your project by running:

```bash
fastlane add_plugin version_from_last_tag
```

## About version\_from\_last\_tag

Perform a regex on last (latest) git tag and perform a regex to extract a version number such as Release 1.2.3

This action requires that a repo have a remote set - as part of the process is to fetch the latest tag set.  It was initially designed for cases where a repo was shallow cloned, however it works perfectly well with full repos as well.  The command will try to fetch the last branch tag entry and try to parse it using a regex. The default regex format is


 ```regex
^\\D*([\\.0-9]*)
 ```

It will look for a sequence of non-digets and then at the first digit it will capture 
any of the following characters:    `0 1 2 3 4 5 6 7 8 9 .`

So for example

```
  release-1.2   => 1.2
  v1.0          => 1.0
  version1      => 1
  version 1.2.3 => 1.2.3
```

This plugin was designed to be used with a **GitFlow** workflow so that version numbers for the release branch would always match the latest tag on master


## Usage

To force the current version number to match whatever the latest release version is you would use the following code block

```ruby
    #Extract Version Number and set it
    version_number = version_from_last_tag
    increment_version_number(version_number: version_number)
    increment_build_number
```

**Note to author:** Please set up a sample project to make it easy for users to explore what your plugin does. Provide everything that is necessary to try out the plugin in this project (including a sample Xcode/Android project if necessary)

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use 

```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/PluginsTroubleshooting.md) doc in the main `fastlane` repo.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Plugins.md).

## About `fastlane`

`fastlane` is the easiest way to automate building and releasing your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
