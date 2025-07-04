# This file was generated by GoReleaser. DO NOT EDIT.
cask "bm" do
  desc "A cross-platform CLI tool for efficient directory bookmarking and navigation"
  homepage "https://github.com/farhancdr/go-bookmark"
  version "1.0.2"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "binary "#{staged_path}/bm"
bash_completion.install "#{staged_path}/completions/bm.bash" => "bm"
zsh_completion.install "#{staged_path}/completions/bm.zsh" => "_bm"
fish_completion.install "#{staged_path}/completions/bm.fish"
"

  on_macos do
    url "https://github.com/farhancdr/go-bookmark/releases/download/v1.0.2/go-bookmark_1.0.2_macOS_universal.tar.gz"
    sha256 "fd69216fbe1215a1f6da568a8793084dfc6e4ded5ba539579b1f20d9807d699b"
  end

  on_linux do
    on_intel do
      url "https://github.com/farhancdr/go-bookmark/releases/download/v1.0.2/go-bookmark_1.0.2_Linux_x86_64.tar.gz"
      sha256 "9d6cc5da0d198e83696d8eb92e2122eec879a89a2077df27b1737bd25620dd95"
    end
    on_arm do
      url "https://github.com/farhancdr/go-bookmark/releases/download/v1.0.2/go-bookmark_1.0.2_Linux_ARM64.tar.gz"
      sha256 "721783ae8231de5c65ff8fecb1cb1f17bdbb2c5248e5f4cee8f508b5c6d19b8c"
    end
  end

  postflight do
    if system_command("/usr/bin/xattr", args: ["-h"]).exit_status == 0
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/bm"]
    end
  end

  caveats do
    "To enable directory navigation with `bm goto`, add the following to your shell configuration:"
    ""
    "For Bash/Zsh (~/.bashrc or ~/.zshrc):"
    "  function bm_goto() {"
    "      local target_dir=$(bm goto "$1")"
    "      if [ -n "$target_dir" ] && [ -d "$target_dir" ]; then"
    "          cd "$target_dir""
    "      else"
    "          echo "Error: $target_dir""
    "      fi"
    "  }"
    "  alias bm_g='bm_goto'"
    ""
    "For Fish (~/.config/fish/config.fish):"
    "  function bm_goto"
    "      set target_dir (bm goto $argv[1])"
    "      if test -n "$target_dir" -a -d "$target_dir""
    "          cd $target_dir"
    "      else"
    "          echo "Error: $target_dir""
    "      end"
    "  end"
    ""
    "After adding, reload your shell with:"
    "  source ~/.bashrc  # or ~/.zshrc or ~/.config/fish/config.fish"
    ""
    "Shell completions have been installed for bash, zsh, and fish."
  end

  # No zap stanza required
end
