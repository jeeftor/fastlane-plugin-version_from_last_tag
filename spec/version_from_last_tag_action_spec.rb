describe Fastlane::Actions::VersionFromLastTagAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The version_from_last_tag plugin is working!")

      Fastlane::Actions::VersionFromLastTagAction.run(nil)
    end
  end
end
