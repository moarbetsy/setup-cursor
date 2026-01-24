# Precursor

**Precursor** (2026 best practices) is a config-driven, idempotent "project doctor" + scaffolder for **Cursor** that supports **HTML/CSS/JS/TS, Python, Rust, C, C++**, Docker, and monorepos.

## Features

- **Idempotent + Atomic**: Running `-Setup` twice produces zero diffs (except timestamps/state)
- **Config-Driven**: All tool IDs/versions come from `precursor.json` (with documented defaults)
- **Deep-Merge**: Never clobbers user config; merges JSON/JSONC/YAML safely
- **Stateful Efficiency**: Hash-based caching for slow operations
- **Safe-by-Default**: Backups before every write; rollback support; strict mode for CI
- **Cross-Platform**: Works on Windows PowerShell 7+ and Unix-like systems

## Installation

### Quick Start (Windows)

```powershell
# Clone or download Precursor
cd precursor
bun install
```

### Prerequisites

- **PowerShell 7+** (Windows/Linux/Mac)
- **Bun** runtime (for TypeScript core)
- **Git** (for monorepo detection)

## Usage

### Basic Commands

```powershell
# Bootstrap project (idempotent)
.\precursor.ps1 -Setup

# Read-only doctor scan -> JSON
.\precursor.ps1 -Scan

# Strict mode (fail on warnings, for CI)
.\precursor.ps1 -Setup -Strict

# Offline mode (no downloads)
.\precursor.ps1 -Setup -Offline

# Rollback latest backup
.\precursor.ps1 -Rollback

# Reset state cache
.\precursor.ps1 -ResetState

# Self-update
.\precursor.ps1 -Update
```

### CI Usage

```powershell
# JSON output, no color
.\precursor.ps1 -Scan --json --no-color > report.json
```

## Configuration

Create `precursor.json` in your project root (or use defaults):

```json
{
  "$schema": "./precursor.schema.json",
  "tools": {
    "python": {
      "runtime": "uv",
      "linter": "ruff",
      "typechecker": "pyright"
    },
    "web": {
      "runtime": "bun",
      "linter": "biome"
    },
    "rust": {
      "toolchain": "stable",
      "linter": "clippy"
    }
  },
  "workspace": {
    "mode": "auto"
  }
}
```

See `precursor.schema.json` for full schema documentation.

## Architecture

- **Entry Point**: `precursor.ps1` (PowerShell orchestrator)
- **Core**: TypeScript running on Bun (`src/`)
- **MCP Server**: `.precursor/mcp/` (local MCP server for Cursor integration)
- **State**: `.precursor/state.json` (hash-based cache)
- **Backups**: `.precursor/backups/<timestamp>/`

## Supported Stacks

### Python
- **uv** for environment + dependency management
- **Ruff** for linting + formatting
- Optional: `pyright` or `basedpyright` for type checking

### Web (HTML/CSS/JS/TS)
- **Bun** runtime + package manager
- **Biome** for formatting/lint/import sorting
- Respects existing ESLint/Prettier if present

### Rust
- `rustup`, `cargo`, `rustfmt`, `clippy`
- Optional: `cargo audit`, `cargo deny`

### C/C++
- CMake default generator
- `clang-format`, `clang-tidy`, `clangd`
- `compile_commands.json` generation support

### Docker
- Dockerfile best-practice checks
- Docker Compose support

## Troubleshooting

### Proxy Issues

Precursor respects standard proxy environment variables:
- `HTTP_PROXY`, `HTTPS_PROXY`
- `NO_PROXY`

### Offline Mode

Use `-Offline` flag to prevent all downloads. Precursor will:
- Use existing tools in PATH
- Use cached binaries in `.precursor/bin/`
- Emit actionable report of missing tools

### Permission Issues

If tool installation fails:
1. Check execution policy: `Get-ExecutionPolicy`
2. Use `-Offline` mode if downloads are blocked
3. Manually install tools and re-run

### State Cache Issues

If state cache becomes stale:
```powershell
.\precursor.ps1 -ResetState
```

### Rollback

Restore from latest backup:
```powershell
.\precursor.ps1 -Rollback
```

Backups are stored in `.precursor/backups/<timestamp>/`.

## Development

### Running Tests

```powershell
bun test
```

### Building

```powershell
bun run build
```

### MCP Server

The MCP server runs automatically when Cursor is configured. Manual start:

```powershell
cd .precursor/mcp
bun run server.ts
```

### Report Collection

Precursor can collect and merge reports from `REPORT.md` files across projects into a single folder for training and learning:

**Via MCP Tool:**
```json
{
  "name": "collect_report",
  "arguments": {
    "reportPath": "REPORT.md",
    "projectName": "my-project",
    "generateMerged": true
  }
}
```

**Configuration:**
```json
{
  "report": {
    "enabled": true,
    "reportsDir": ".precursor/reports",
    "autoCollect": false,
    "projectName": "my-project"
  }
}
```

Reports are stored in `.precursor/reports/` as individual JSON files, with automatic duplicate detection. A merged markdown report can be generated for easy review.

## License

See LICENSE file in repository root.
