class AgentMesh < Formula
  desc "MCP control plane that lets coding agents talk to each other's sessions"
  homepage "https://github.com/mubashir1osmani/agent-mesh"
  url "https://github.com/mubashir1osmani/agent-mesh/releases/download/v0.0.1/agent-mesh-0.0.1-macos-universal.tar.gz"
  sha256 "327d5ca5e3b57339ad19df79081ab1f197a5b7237e78b06b221eed6df409e3c0"
  license "MIT"

  def install
    bin.install "agent-mesh"
  end

  def caveats
    <<~CAVEATS
      Point an agent at the server to start using it:

        claude mcp add --scope user agent-mesh -- #{opt_bin}/agent-mesh

      For opencode, add to ~/.config/opencode/opencode.json:

        { "mcp": { "agent-mesh": { "type": "local",
          "command": ["#{opt_bin}/agent-mesh"], "enabled": true } } }

      For codex, add to ~/.codex/config.toml:

        [mcp_servers.agent-mesh]
        command = "#{opt_bin}/agent-mesh"

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
