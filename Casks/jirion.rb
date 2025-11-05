# frozen_string_literal: true

cask "jirion" do
  version "0.1.9"
  sha256 "01eaf7944b34917789745b8f4c57ede9cbfcebab183590e96163666eb22c171d"
  on_intel do
    url "https://github.com/scramb/Jirion/releases/download/#{version}/Jirion-Intel.tar.gz"
  end
  on_arm do
    url "https://github.com/scramb/Jirion/releases/download/#{version}/Jirion-arm64.tar.gz"
  end
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
