# homebrew-agent-mesh

Homebrew tap for [agent-mesh](https://github.com/mubashir1osmani/agent-mesh), an MCP server that
lets your coding agents talk to each other's sessions.

```bash
brew install mubashir1osmani/agent-mesh/agent-mesh
```

Then point an agent at it:

```bash
claude mcp add --scope user agent-mesh -- "$(brew --prefix)/bin/agent-mesh"
```

Requires macOS (the bottle is a universal binary covering Apple Silicon and Intel). On Linux,
build from source: `cargo build --release`.
