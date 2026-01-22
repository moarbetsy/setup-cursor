# setup_cursor

A streamlined development environment setup for Cursor IDE + PowerShell on Windows. One command creates clean, fully-configured projects with a minimal Explorer view.

## ✨ Features

- **Clean Project Explorer**: New projects show only `src/` folder - everything else stays hidden but functional
- **Smart Auto-Setup**: Automatic Python virtual environment, dependency installation, and IDE configuration
- **Interactive Dashboard**: Menu-driven interface when no entrypoint is found
- **.env Support**: Automatic loading of environment variables from `.env` files
- **Project Templates**: Bootstrap new projects with proper structure and tooling
- **Issue Tracking**: Built-in `REPORT.md` for logging and tracking development issues

## 🚀 Quick Start

### 🌐 Install from ANY Computer (New!)

**From any Windows computer with internet access, run this one command:**

```powershell
# Install globally (recommended)
irm https://raw.githubusercontent.com/setup-cursor/setup-cursor/main/install-from-anywhere.ps1 | iex

# Or use portably without installation
irm https://raw.githubusercontent.com/yourusername/setup-cursor/main/setup-cursor-portable.ps1 | iex -Setup
```

**Then use from anywhere:**
```powershell
setup-cursor -Setup      # Complete environment setup
setup-cursor -Doctor     # Check environment health
setup-cursor -NewProject "my-app"  # Create new project
```

#### Distribution Options

1. **One-liner Install**: `irm https://raw.githubusercontent.com/setup-cursor/setup-cursor/main/install-from-anywhere.ps1 | iex`
2. **Portable Usage**: `irm https://raw.githubusercontent.com/yourusername/setup-cursor/main/setup-cursor-portable.ps1 | iex -Setup`
3. **Winget Package**: `winget install YourName.SetupCursor` (once published)
4. **GitHub Release**: Download ZIP from releases page
5. **PowerShell Gallery**: `Install-Module setup-cursor` (once published)

### Publishing setup-cursor

To make setup-cursor available from any computer worldwide:

#### 1. Create GitHub Repository
```bash
# Upload all files from setup_cursor folder to GitHub
git init
git add .
git commit -m "Initial release"
git remote add origin https://github.com/setup-cursor/setup-cursor.git
git push -u origin main
```

#### 2. Create Release
```powershell
.\create-release.ps1 -Version "1.0.0" -GitHubToken "your_github_token"
```

#### 3. Submit to Winget
```powershell
# Edit setup-cursor.winget-manifest.yaml with your details
# Submit PR to https://github.com/microsoft/winget-pkgs
```

#### 4. Submit to PowerShell Gallery
```powershell
# Create module structure and submit to PSGallery
Publish-Module -Path .\setup-cursor -NuGetApiKey "your_api_key"
```

### 🖥️ Make setup-cursor Available Locally

To use `setup-cursor` from **any Cursor/PowerShell session**, choose one of these methods:

#### Option 1: Batch File Wrapper (Easiest)
```cmd
# Automated installation
.\install-global.ps1 -Method BatchFile

# Or manual installation:
copy setup-cursor.cmd C:\Windows\System32\
```
Now use from anywhere:
```powershell
setup-cursor -Setup
```

#### Option 2: PowerShell Profile (Recommended)
```powershell
# Automated installation
.\install-global.ps1 -Method PowerShellProfile

# Or manual installation:
notepad $PROFILE.CurrentUserAllHosts
# Add this line: . "C:\Path\To\setup_cursor\setup-cursor-profile.ps1"
```
Restart PowerShell/Cursor and use:
```powershell
setup-cursor -Setup
# Or the shorter alias:
sc -Setup
```

#### Option 3: Add to PATH
```powershell
# Automated installation
.\install-global.ps1 -Method Path

# Or manual installation:
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Path\To\setup_cursor", "User")
```
Then use from anywhere:
```powershell
.\run.ps1 -Setup
```

### 🔥 One-Command Complete Setup (New!)

For the ultimate "winget-like" experience, run this single command to set up your entire development environment:

```powershell
.\run.ps1 -Setup
```

This comprehensive setup automatically:
- ✅ Installs UV, Bun, Git via winget
- ✅ Updates Python and all dependencies
- ✅ Applies Cursor/VSCode settings
- ✅ Fixes known issues from REPORT.md
- ✅ Sets up MCP servers
- ✅ Configures IntelliSense
- ✅ Bootstraps project files
- ✅ Validates everything works

**Result**: A fully configured development environment ready for coding!

### Prerequisites

#### Required
- **PowerShell 7**: `winget install --id Microsoft.PowerShell --source winget`
- **Python 3.8+**: `winget install Python.Python.3` or [python.org](https://python.org)

#### Recommended
- **UV**: Fast Python package manager - `winget install astral-sh.uv`
- **Bun**: Fast JavaScript runtime - `winget install -e --id Oven-sh.Bun`
  - **Note**: Requires AVX2 instruction set support. If your CPU doesn't support AVX2, use `winget install -e --id Oven-sh.Bun.Baseline` instead

### First Time Setup

```powershell
# Clone or download setup_cursor to your desktop
cd "$HOME\Desktop"

# Apply Cursor settings (one-time setup)
.\run.ps1 -ApplyCursorSettings
```

### Create Your First Project

```powershell
# Create a new project (automatically configured!)
.\run.ps1 -NewProject "my-awesome-project"

# Project appears in Desktop\my-awesome-project with only src/ visible
```

### Start Developing

```powershell
# Navigate to your project
cd "$HOME\Desktop\my-awesome-project"

# Run your project (opens interactive dashboard if no entrypoint)
.\run.ps1
```

## 📁 Clean Project Structure

New projects created with `-NewProject` show **only** the `src/` folder in your IDE Explorer:

```
my-awesome-project/
└── src/          ← Only visible folder in IDE Explorer
```

**Everything else exists but is excluded from IDE view:**
- `run.ps1` - Project runner and utilities
- `.venv/` - Python virtual environment
- `.vscode/` - VSCode/Cursor settings
- `.cursor/` - Cursor AI rules
- `node_modules/` - JavaScript dependencies
- `logs/` - Execution logs
- `REPORT.md` - Issue tracking
- And more...

> **Excluded ≠ Broken**: All files remain fully functional and accessible. You can still run `.\run.ps1` - the IDE just doesn't show it by default for a cleaner view!

## 🔧 Comprehensive Setup Details

The `.\run.ps1 -Setup` command performs these steps automatically:

### 📦 Tool Installation & Updates
- Installs UV (modern Python package manager)
- Installs Bun (fast JavaScript runtime)
- Installs Git (version control)
- Updates all tools to latest versions
- Refreshes PATH environment

### 🐍 Python Environment
- Updates Python and pip
- Creates/updates virtual environment
- Installs dependencies (supports both requirements.txt and pyproject.toml)
- Validates environment functionality

### ⚙️ IDE Configuration
- Applies Cursor settings for PowerShell development
- Configures IntelliSense for Python/JavaScript
- Sets up terminal profiles
- Applies file exclusions for clean workspace view

### 🔧 Issue Resolution
- Fixes PowerShell extension stability issues
- Sets proper execution policies
- Applies UTF-8 encoding fixes
- Resolves virtual environment issues

### 🤖 MCP & AI Setup
- Configures Model Context Protocol servers
- Sets up AI assistance tools
- Applies Cursor workspace rules

### 📁 Project Bootstrap
- Creates missing essential files
- Sets up proper project structure
- Initializes issue tracking

## 🎛️ Interactive Dashboard

When you run `setup-cursor` (global) or `.\run.ps1` (local) in a project without entrypoints, you'll see:

```
== SETUP PROJECT DASHBOARD ==
Project: C:\Users\You\Desktop\my-project

 [1] Run Python Entrypoint (main.py)
 [2] Run JS Entrypoint (bun run dev)
 [3] Apply Cursor/VSCode Settings
 [4] Clean Project (Reset venv/modules)
 [5] Reveal hidden project files
 [6] Run Comprehensive Setup (winget-like)
 [7] Install/Update Development Tools
 [8] Update Python Environment
 [9] Apply Known Issue Fixes
 [Q] Quit

Select an option:
```

### Dashboard Options

- **1**: Execute `main.py` if it exists
- **2**: Run JavaScript via `bun run dev`
- **3**: Reapply IDE settings
- **4**: Clean and reset project environment
- **5**: **Reveal all hidden files** (escape hatch)
- **6**: 🚀 **Run complete environment setup**
- **7**: 📦 Install/update development tools
- **8**: 🐍 Update Python and dependencies
- **9**: 🔧 Apply fixes for known issues
- **Q**: Exit

## ⚙️ All Commands

### 🎯 Comprehensive Setup Commands

```powershell
# 🚀 COMPLETE ENVIRONMENT SETUP (winget-like)
setup-cursor -Setup           # Global command (after setup)
.\run.ps1 -Setup              # Local command (in setup_cursor folder)

# Individual setup components
setup-cursor -InstallTools    # Install UV, Bun, Git
setup-cursor -UpdatePython    # Update Python & dependencies
setup-cursor -ApplyAllSettings # Apply all IDE settings
setup-cursor -FixIssues       # Apply known issue fixes
setup-cursor -SetupMCP        # Setup MCP servers

# Short alias (if using PowerShell profile)
sc -Setup                     # Same as setup-cursor -Setup
```

### 🛠️ Standard Commands

```powershell
# Run project (auto-detects entrypoints or shows dashboard)
setup-cursor                  # Global command
.\run.ps1                     # Local command

# Environment diagnostics and health check
setup-cursor -Doctor          # Global command
.\run.ps1 -Doctor             # Local command

# Environment check (no execution)
setup-cursor -PreflightOnly   # Global command
.\run.ps1 -PreflightOnly      # Local command

# Apply Cursor settings to your IDE
setup-cursor -ApplyCursorSettings  # Global command
.\run.ps1 -ApplyCursorSettings     # Local command

# Create new project
setup-cursor -NewProject "project-name"
setup-cursor -NewProject "project-name" -DestinationRoot "C:\Projects"
.\run.ps1 -NewProject "project-name"

# Clean project (remove venv, node_modules, build artifacts)
setup-cursor -Clean           # Global command
.\run.ps1 -Clean              # Local command

# Bootstrap current directory (create missing files)
setup-cursor -Bootstrap       # Global command
.\run.ps1 -Bootstrap          # Local command

# Custom entrypoints
setup-cursor -PythonEntrypoint ".\custom.py"
setup-cursor -JsScript "build"
```

## 🔧 Configuration

### Environment Variables (.env)

Create a `.env` file in your project root:

```bash
# .env
API_KEY=your-secret-key
DEBUG=true
DATABASE_URL=sqlite:///app.db

# Comments are ignored
```

Variables are automatically loaded on startup and available to your code.

### Project Entrypoints

The script auto-detects and runs:

1. **Python**: `main.py` (or custom via `-PythonEntrypoint`)
2. **JavaScript**: `package.json` scripts via Bun (default: `bun run dev`)

### IDE Settings Applied

- PowerShell 7 as default terminal
- ISE-like IntelliSense for PowerShell
- Python/PowerShell development optimizations
- Custom Cursor rules for consistent AI assistance

## 🔍 Troubleshooting

### PowerShell Execution Policy
```powershell
# Allow script execution
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Terminal Issues in Cursor
Enable "Legacy Terminal Tool" in Cursor settings (`Ctrl+Shift+J` → Chat/Agents → Terminal).

### Missing Tools
```powershell
# Check what's available
.\run.ps1 -PreflightOnly
```

### Bun Installation Issues
If `winget install Oven.Bun` fails with "No package found", use the correct command:
```powershell
# Correct Bun installation command
winget install -e --id Oven-sh.Bun
```

**AVX2 CPU Requirement**: Bun requires AVX2 instruction set support. If installation fails or Bun crashes on startup, your CPU may not support AVX2. In that case, install the baseline version:
```powershell
# For CPUs without AVX2 support
winget install -e --id Oven-sh.Bun.Baseline
```

After installation, verify with:
```powershell
bun --version
```

### Reveal Hidden Files in IDE
Use dashboard option **5** to reveal all files in your IDE Explorer. This removes the file exclusions from your `.vscode/settings.json` so you can see everything.

> **Note**: This doesn't change any Windows file attributes - it only affects what your IDE displays.

### Issues Persist?
Log errors in `REPORT.md` with exact commands and error messages. The report includes prevention strategies for common issues.

## 🎯 Philosophy

**"Everything I touch goes in src; everything else is the machine room."**

- **Clean Explorer**: Focus on your code, not tooling
- **Zero-config**: Projects work out of the box
- **Stable**: Battle-tested for Cursor + PowerShell on Windows
- **Flexible**: Supports Python, JavaScript, or both
- **Debuggable**: Comprehensive logging and issue tracking

## 🌍 Using setup-cursor from Any Computer

### From Your Local Computer
After local installation, you can run setup-cursor commands from **any** PowerShell terminal or Cursor session:

```powershell
# From any directory, in any Cursor session:
setup-cursor -Setup           # Complete environment setup
setup-cursor -Doctor          # Check environment health
setup-cursor -NewProject "my-app"  # Create new project
setup-cursor -InstallTools    # Install development tools

# Short alias (PowerShell profile method):
sc -Setup                     # Same as setup-cursor -Setup

# Create project anywhere:
cd "C:\MyProjects"
setup-cursor -NewProject "web-app"
cd "web-app"
setup-cursor                   # Run the project
```

### From ANY Computer Worldwide 🌐

**From any Windows computer with internet access:**

#### Option 1: Install Globally (Recommended)
```powershell
irm https://raw.githubusercontent.com/setup-cursor/setup-cursor/main/install-from-anywhere.ps1 | iex
```

#### Option 2: Use Portably (No Installation)
```powershell
irm https://raw.githubusercontent.com/yourusername/setup-cursor/main/setup-cursor-portable.ps1 | iex -Setup
```

#### Option 3: Via Winget (Once Published)
```powershell
winget install YourName.SetupCursor
```

### What You Get

- ✅ **Winget-like experience** from any computer
- ✅ **One-line installation** - no complex setup required
- ✅ **Complete environment setup** with single command
- ✅ **Portable usage** - run without installation
- ✅ **Global availability** - works on any Windows machine

**setup-cursor is now available from ANY computer!** 🎉🚀✨

## 📝 What's Included

Each project comes with:
- `src/` - Your code goes here
- `run.ps1` - Single-command runner
- `main.py` - Python entry point template
- `requirements.txt` - Python dependencies
- `package.json` - JavaScript dependencies (optional)
- `.gitignore` - Git ignore patterns
- `REPORT.md` - Issue tracking and troubleshooting guide
- `README.md` - Project documentation template

Happy coding! 🚀
