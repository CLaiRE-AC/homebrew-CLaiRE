# This file is automatically generated by https://github.com/heroku/cli/blob/main/scripts/release/homebrew.js
# Do not update this file directly;
# Please update the template instead:
# https://github.com/heroku/cli/blob/main/scripts/release/homebrew/templates/heroku.rb
class Claire < Formula
  desc "CLaiRE CLI for use with CLaiRE SaaS API"
  homepage "https://claire.ac"
  url "https://github.com/CLaiRE-AC/CLaiRE/releases/download/v0.1.0/claire-v0.1.0-d4133e7a-linux-x64.tar.xz"
  sha256 "39dcabef10ada028ea83e45a4bc3f3cb6512d137b263744a6717c76f2795ed3a"
  version "0.1.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/CLaiRE-AC/CLaiRE/releases/download/v0.1.0/claire-v0.1.0-d4133e7a-linux-arm64.tar.xz"
      sha256 "557119456c5079d88e9cff587e345a695fdc1d7ef47659806dc89f195cfb0f61"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/CLaiRE-AC/CLaiRE/releases/download/v0.1.0/claire-v0.1.0-d4133e7a-linux-x64.tar.xz"
      sha256 "39dcabef10ada028ea83e45a4bc3f3cb6512d137b263744a6717c76f2795ed3a"
    end
    on_arm do
      url "https://github.com/CLaiRE-AC/CLaiRE/releases/download/v0.1.0/claire-v0.1.0-d4133e7a-linux-arm.tar.xz"
      sha256 "2635a98b7d9f1ac0a7ae76e58a3e6714631061e04b5370027915fe2f3daf7819"
    end
  end

  def install
    inreplace "bin/claire", /^CLIENT_HOME=/, "export CLAIRE_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/claire"

    bash_completion.install libexec/"autocomplete-scripts/brew/bash" => "claire"
    zsh_completion.install libexec/"autocomplete-scripts/brew/zsh/_claire"
  end

  def caveats; <<~EOS
    To use the CLaiRE CLI's autocomplete --
      Via homebrew's shell completion:
        1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
            NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
                  and called, either explicitly or via a framework like oh-my-zsh.
        2) Then run
          $ claire autocomplete --refresh-cache
      OR
      Use our standalone setup:
        1) Run and follow the install steps:
          $ claire autocomplete
  EOS
  end

  test do
    system bin/"claire", "version"
  end
end