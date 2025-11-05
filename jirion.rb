# frozen_string_literal: true

cask "jirion" do
  version "0.1.9"
  sha256 "0862d236ab074635705760ed41bfdd60a0ed729944da0fcc73a43d8a1cd707ae"

  url "https://github.com/scramb/Jirion/releases/download/#{version}/Jirion.app.tar.gz"
  name "Jirion"
  desc "Tool to manage Jira-Cloud Backlog from local application"
  homepage "https://github.com/scramb/Jirion"

  app "Jirion.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Jirion.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Jirion",
    "~/Library/Preferences/fyne/com.scramb.jirion",
    "~/Library/Saved Application State/com.scramb.jirion.savedState",
  ]
end
