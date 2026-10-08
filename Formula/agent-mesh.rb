class AgentMesh < Formula
  desc "MCP control plane that lets coding agents talk to each other's sessions"
  homepage "https://github.com/mubashir1osmani/agent-mesh"
  url "https://github.com/mubashir1osmani/agent-mesh/releases/download/v0.0.3/agent-mesh-0.0.3-macos-universal.tar.gz"
  sha256 "0ad165473ec4e46cf1022072eba8f4d24aefd06b8ad56c952ee1ec85a95ba0d3"
  license "MIT"

  def install
    bin.install "agent-mesh"
  end

  def caveats
    <<~CAVEATS
      Point an agent at the server to start using it:

        claude mcp add --scope user agent-mesh -- agent-mesh

      For opencode, add to ~/.config/opencode/opencode.json:

        { "mcp": { "agent-mesh": { "type": "local",
          "command": ["agent-mesh"], "enabled": true } } }

      For codex, add to ~/.codex/config.toml:

        [mcp_servers.agent-mesh]
        command = "agent-mesh"

      Live sessions can message each other through a shared hub. To have
      Claude Code pick up messages outside tmux, add the agent-mesh hooks
      from the README to ~/.claude/settings.json. spawn_node needs tmux.

      agent-mesh drives agents non-interactively, which means their permission
      prompts are auto-approved. Point it at code you are willing to let agents
      modify.
    CAVEATS
  end

  test do
    assert_match "agent-mesh #{version}", shell_output("#{bin}/agent-mesh --version")
    assert_match "MCP control plane", shell_output("#{bin}/agent-mesh --help")
  end
end
