# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Jirion < Formula
  desc "Tool to manage Jira-Cloud Backlog from local application"
  homepage "https://github.com/scramb/Jirion"
  url "https://github.com/scramb/Jirion/archive/refs/tags/0.1.1.tar.gz"
  sha256 "0862d236ab074635705760ed41bfdd60a0ed729944da0fcc73a43d8a1cd707ae"
  license "NOASSERTION"

  depends_on "go" => :build

  def install
    system "go", "install", "fyne.io/fyne/v2/cmd/fyne@latest"
    system "fyne", "package", "-release", "-os", "darwin", "-icon", "./assets/app.png", "-name", "Jirion", "-appID", "com.scramb.jirion"
  end

  if OS.mac? && MacOS.version >= :catalina
    app_path = "Jirion.app"
    quarantine_list = ""
    begin
      quarantine_list = Utils.safe_popen_read("xattr", app_path.to_s)
    rescue ErrorDuringExecution
      quarantine_list = ""
    end
    if quarantine_list.include?("com.apple.quarantine")
      chmod 0755, app_path
      system "xattr", "-d", "com.apple.quarantine", app_path
      chmod 0555, app_path
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test jirion`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
