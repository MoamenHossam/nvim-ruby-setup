# Neovim Configuration

A modern Neovim configuration built on the Kickstart.nvim framework with extensive plugin support for development, particularly focused on Ruby/Rails development.

## Table of Contents

- [Leader Key](#leader-key)
- [Core Settings](#core-settings)
- [General Keybindings](#general-keybindings)
- [Installed Plugins](#installed-plugins)
  - [File Navigation & Search](#file-navigation--search)
  - [LSP & Completion](#lsp--completion)
  - [Git Integration](#git-integration)
  - [Code Quality & Formatting](#code-quality--formatting)
  - [AI Assistance](#ai-assistance)
  - [UI & Appearance](#ui--appearance)
  - [Testing](#testing)
  - [Debugging](#debugging)
  - [Utilities](#utilities)
- [Plugin Details](#plugin-details)

## Leader Key

**Leader key is set to `Space`**

```lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
```

## Core Settings

- Line numbers (relative and absolute)
- Mouse support enabled
- Clipboard sync with OS
- Smart case-insensitive search
- Auto-save undo history
- Split windows open right/below
- Treesitter-based folding (all folds open by default)
- Scroll offset of 15 lines
- Cursor line highlighting

## General Keybindings

### Basic Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<Esc>` | Normal | Clear search highlighting |
| `<C-h>` | Normal | Move focus to left window |
| `<C-l>` | Normal | Move focus to right window |
| `<C-j>` | Normal | Move focus to lower window |
| `<C-k>` | Normal | Move focus to upper window |
| `<C-d>` | Normal | Half-page down and center cursor |
| `<C-u>` | Normal | Half-page up and center cursor |
| `<C-a>` | Normal | Select all text in buffer |

### Terminal Mode

| Key | Mode | Action |
|-----|------|--------|
| `<Esc><Esc>` | Terminal | Exit terminal mode |

### Diagnostics

| Key | Mode | Action |
|-----|------|--------|
| `<leader>q` | Normal | Open diagnostic quickfix list |

### Custom Features

| Key | Mode | Action |
|-----|------|--------|
| `<leader>oc` | Normal | Toggle OpenCode in tmux pane |

## Installed Plugins

### File Navigation & Search

#### Telescope (nvim-telescope/telescope.nvim)
Fuzzy finder for files, buffers, and more.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>sh` | Normal | Search help tags |
| `<leader>sk` | Normal | Search keymaps |
| `<leader>sf` | Normal | Search files |
| `<leader>ss` | Normal | Search select Telescope pickers |
| `<leader>sw` | Normal | Search current word |
| `<leader>sg` | Normal | Search by grep (live) |
| `<leader>sd` | Normal | Search diagnostics |
| `<leader>sr` | Normal | Resume last search |
| `<leader>s.` | Normal | Search recent files |
| `<leader><leader>` | Normal | Find existing buffers |
| `<leader>/` | Normal | Fuzzy search in current buffer |
| `<leader>s/` | Normal | Live grep in open files |
| `<leader>sn` | Normal | Search Neovim config files |
| `<c-enter>` | Insert (Telescope) | Refine search with fuzzy finding |

**Extensions:**
- telescope-fzf-native.nvim (fast fuzzy finder)
- telescope-ui-select.nvim (use Telescope for vim.ui.select)

**Configuration:**
- Ignores: `node_modules`, `tmp`, `log`, `vendor`
- Shows hidden files in find_files picker

#### Neo-tree (nvim-neo-tree/neo-tree.nvim)
File explorer sidebar.

| Key | Mode | Action |
|-----|------|--------|
| `\` | Normal | Open/reveal file in Neo-tree |
| `<leader>\` | Normal (in Neo-tree) | Close Neo-tree window |

**Features:**
- Follows current file automatically
- Shows gitignored files
- Doesn't auto-open on startup

#### Harpoon (ThePrimeagen/harpoon)
Quick file navigation with marks.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>m` | Normal | Mark current file in Harpoon |
| `<leader>M` | Normal | View Harpoon marks with Telescope |
| `<leader>1` | Normal | Jump to Harpoon file 1 |
| `<leader>2` | Normal | Jump to Harpoon file 2 |
| `<leader>3` | Normal | Jump to Harpoon file 3 |
| `<leader>4` | Normal | Jump to Harpoon file 4 |
| `<C-n>` | Normal | Next Harpoon file |
| `<C-p>` | Normal | Previous Harpoon file |

### LSP & Completion

#### LSP Config (neovim/nvim-lspconfig)
Language Server Protocol support with Mason.

**LSP Keybindings (available when LSP is attached):**

| Key | Mode | Action |
|-----|------|--------|
| `grn` | Normal | Rename symbol |
| `gra` | Normal, Visual | Code action |
| `grr` | Normal | Go to references |
| `gri` | Normal | Go to implementation |
| `grd` | Normal | Go to definition |
| `grD` | Normal | Go to declaration |
| `grt` | Normal | Go to type definition |
| `gO` | Normal | Open document symbols |
| `gW` | Normal | Open workspace symbols |
| `K` | Normal | Show hover documentation |
| `<leader>th` | Normal | Toggle inlay hints |

**Configured Language Servers:**
- `lua_ls` (Lua)
- `ruby_lsp` (Ruby) - runs via `bundle exec`

**Additional Tools:**
- mason.nvim (LSP/DAP/linter installer)
- mason-lspconfig.nvim (bridges Mason and lspconfig)
- mason-tool-installer.nvim (auto-installs tools)
- fidget.nvim (LSP progress notifications)

**Features:**
- Auto-highlights symbol under cursor
- Diagnostic virtual text for errors/warnings
- Rounded borders on diagnostic floats
- Nerd font icons for diagnostic signs

#### Blink.cmp (saghen/blink.cmp)
Modern completion engine with snippet support.

| Key | Preset | Action |
|-----|--------|--------|
| Default preset keybindings | Insert | Navigate and select completions |

**Features:**
- LSP, path, and snippet completion
- LuaSnip integration for snippets
- Lazydev integration for Neovim Lua API
- Manual documentation popup (not automatic)
- Signature help enabled

#### Lazydev (folke/lazydev.nvim)
Better Lua development for Neovim config.

**Features:**
- Neovim Lua API completion
- vim.uv library support

### Git Integration

#### Gitsigns (lewis6991/gitsigns.nvim)
Git status in sign column with hunk operations.

**Navigation:**

| Key | Mode | Action |
|-----|------|--------|
| `]c` | Normal | Jump to next git change |
| `[c` | Normal | Jump to previous git change |

**Hunk Actions:**

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gs` | Normal | Stage hunk |
| `<leader>gs` | Visual | Stage selected lines |
| `<leader>gr` | Normal | Reset hunk |
| `<leader>gr` | Visual | Reset selected lines |
| `<leader>gS` | Normal | Stage entire buffer |
| `<leader>gu` | Normal | Undo stage hunk |
| `<leader>gR` | Normal | Reset entire buffer |
| `<leader>gp` | Normal | Preview hunk |
| `<leader>gb` | Normal | Blame line |
| `<leader>gd` | Normal | Diff against index |
| `<leader>gD` | Normal | Diff against last commit |

**Toggles:**

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tg` | Normal | Toggle git blame line |
| `<leader>tp` | Normal | Toggle inline preview |

**Sign Characters:**
- `+` : Added lines
- `~` : Changed lines
- `_` : Deleted lines
- `‾` : Top delete
- `~` : Change delete

#### LazyGit (kdheepak/lazygit.nvim)
Terminal UI for git commands.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gg` | Normal | Open LazyGit |

### Code Quality & Formatting

#### Conform.nvim (stevearc/conform.nvim)
Code formatting with multiple formatter support.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>f` | Normal, Visual | Format buffer or selection |

**Configured Formatters:**
- `stylua` for Lua files

**Auto-format on save:**
- Enabled for most filetypes
- Disabled for: C, C++, Ruby
- Falls back to LSP formatting if no formatter configured

#### Nvim-lint (mfussenegger/nvim-lint)
Asynchronous linting engine.

**Configured Linters:**
- `rubocop` for Ruby files

**Auto-lint triggers:**
- On buffer enter
- After saving
- On leaving insert mode

### AI Assistance

#### GitHub Copilot (github/copilot.vim)
AI-powered code completion.

| Key | Mode | Action |
|-----|------|--------|
| `<C-l>` | Insert | Accept Copilot suggestion |

**Enabled for:**
- All filetypes (except TelescopePrompt)
- Git commits
- Markdown files

#### CopilotChat (CopilotC-Nvim/CopilotChat.nvim)
Chat interface for GitHub Copilot.

**Normal Mode:**

| Key | Mode | Action |
|-----|------|--------|
| `<leader>zc` | Normal | Open Copilot chat |
| `<leader>zm` | Normal | Generate commit message |

**Visual Mode (on selected code):**

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ze` | Visual | Explain code |
| `<leader>zr` | Visual | Review code |
| `<leader>zf` | Visual | Fix code issues |
| `<leader>zo` | Visual | Optimize code |
| `<leader>zd` | Visual | Generate documentation |
| `<leader>zt` | Visual | Generate tests |
| `<leader>zs` | Visual | Generate commit for selection |
| `<leader>zq` | Visual | Chat about selection |

#### Claude Code (coder/claudecode.nvim)
Claude Code CLI integration with WebSocket-based editor awareness.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>cc` | Normal | Toggle Claude terminal |
| `<leader>cf` | Normal | Focus/unfocus Claude pane |
| `<leader>cr` | Normal | Resume previous session |
| `<leader>cC` | Normal | Continue session |
| `<leader>cs` | Visual | Send selection to Claude |
| `<leader>cb` | Normal | Add current buffer to context |
| `<leader>ca` | Normal | Accept diff |
| `<leader>cd` | Normal | Deny diff |

**Features:**
- WebSocket server for Claude Code CLI communication
- Inline diff review (accept/deny)
- Visual selection sharing
- Terminal split (right side, 40% width)

#### OpenCode (NickvanDyke/opencode.nvim)
AI coding assistant integration.

| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Normal, Terminal | Toggle/focus OpenCode window |
| `<leader>oa` | Normal, Visual | Ask OpenCode with "@this:" prefix |
| `<C-x>` | Normal, Visual | Execute OpenCode action menu |
| `go` | Normal, Visual | Add range to OpenCode |
| `goo` | Normal | Add current line to OpenCode |
| `<S-C-u>` | Normal | OpenCode half page up |
| `<S-C-d>` | Normal | OpenCode half page down |

### UI & Appearance

#### Which-key (folke/which-key.nvim)
Displays available keybindings in popup.

**Features:**
- Shows keybindings after 1ms delay
- Groups organized by prefix:
  - `<leader>s` : Search
  - `<leader>g` : Git
  - `<leader>d` : Debug
  - `<leader>r` : RSpec
  - `<leader>t` : Toggle
  - `<leader>c` : Claude
  - `<leader>w` : Workspace
  - `<leader>z` : Copilot
  - `<leader>o` : OpenCode

#### Mini.nvim (echasnovski/mini.nvim)
Collection of minimal Lua plugins.

**Included modules:**
- `mini.ai` : Extended text objects (searches 500 lines)
- `mini.surround` : Add/delete/replace surroundings
- `mini.statusline` : Minimal statusline

#### Treesitter (nvim-treesitter/nvim-treesitter)
Advanced syntax highlighting and code understanding.

**Features:**
- Auto-install parsers for opened files
- Syntax highlighting enabled
- Smart indentation (disabled for Ruby)
- Additional regex highlighting for Ruby

**Pre-installed parsers:**
- bash, c, diff, html, lua, luadoc, markdown, markdown_inline, query, vim, vimdoc

#### Indent-blankline (lukas-reineke/indent-blankline.nvim)
Displays indent guides.

**Features:**
- Shows indentation levels visually
- Uses default configuration

#### Autopairs (windwp/nvim-autopairs)
Automatically close brackets, quotes, etc.

**Features:**
- Auto-closes pairs in insert mode
- Integrates with completion

#### Color Schemes

Three color schemes are available:

1. **Catppuccin** (catppuccin/nvim)
   - Flavour: Frappe
   - Not transparent
   - Integrations: gitsigns, nvimtree, treesitter, telescope

2. **Tokyo Night** (folke/tokyonight.nvim)
   - Default configuration

3. **Solarized Osaka** (craftzdog/solarized-osaka.nvim) **(ACTIVE)**
   - Transparent background enabled
   - Currently set as the active colorscheme

#### Todo Comments (folke/todo-comments.nvim)
Highlight and search for TODO comments.

**Features:**
- Highlights TODO, HACK, FIX, NOTE, etc.
- Signs disabled
- Searchable with Telescope

### Testing

#### RSpec.nvim (h3pei/rspec.nvim)
Run RSpec tests from Neovim.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>rn` | Normal | Run nearest spec |
| `<leader>rf` | Normal | Run current file specs |
| `<leader>ra` | Normal | Run all specs |
| `<leader>rr` | Normal | Rerun last spec |
| `<leader>rF` | Normal | Run spec file in side terminal |
| `<leader>rN` | Normal | Run individual spec in side terminal |

**Configuration:**
- Runs via Docker Compose (service: `web`)
- Command: `docker-compose exec -T web bundle exec rspec`
- Float window: 30 lines high, 160 chars wide, rounded border

### Debugging

#### DAP (mfussenegger/nvim-dap)
Debug Adapter Protocol support.

| Key | Mode | Action |
|-----|------|--------|
| `<F5>` | Normal | Start/Continue debugging |
| `<F1>` | Normal | Step into |
| `<F2>` | Normal | Step over |
| `<F3>` | Normal | Step out |
| `<F7>` | Normal | Toggle debug UI |
| `<leader>db` | Normal | Toggle breakpoint |
| `<leader>dB` | Normal | Set conditional breakpoint |

**Included adapters:**
- nvim-dap-ui (Beautiful debug UI)
- nvim-dap-go (Go debugging with Delve)
- mason-nvim-dap (Auto-install debug adapters)

**Configured debuggers:**
- Delve (for Go)

### Utilities

#### Auto-session (rmagatti/auto-session)
Automatic session management.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>wr` | Normal | Search/restore sessions |
| `<leader>ws` | Normal | Save current session |
| `<leader>wa` | Normal | Toggle session autosave |

**Features:**
- Git branch-based sessions
- No auto-restore on branch change
- Suppressed directories: `~/`, `~/Projects`, `~/Downloads`, `/`

#### Vim-be-good (ThePrimeagen/vim-be-good)
Vim practice game.

**Usage:**
```vim
:VimBeGood
```

## Summary

### Total Plugins: 28

**Categories:**
- **File Navigation & Search**: 3 plugins (Telescope, Neo-tree, Harpoon)
- **LSP & Completion**: 3 plugins (lspconfig, blink.cmp, lazydev)
- **Git Integration**: 2 plugins (Gitsigns, LazyGit)
- **Code Quality & Formatting**: 2 plugins (Conform, nvim-lint)
- **AI Assistance**: 4 plugins (Copilot, CopilotChat, Claude Code, OpenCode)
- **UI & Appearance**: 7 plugins (which-key, mini.nvim, treesitter, indent-blankline, autopairs, 3 colorschemes, todo-comments)
- **Testing**: 1 plugin (RSpec.nvim)
- **Debugging**: 1 plugin (nvim-dap with UI and Go support)
- **Utilities**: 2 plugins (Auto-session, Vim-be-good)

### Language Support

**Primary:**
- Ruby/Rails (LSP, linting with Rubocop, formatting disabled, RSpec testing)
- Lua (LSP, formatting with Stylua, enhanced API support)

**Additional:**
- Go (debugging support)
- HTML, Bash, C (Treesitter parsing)

### Key Features

- **AI-Powered Development**: Four AI assistants (Copilot, CopilotChat, Claude Code, OpenCode)
- **Ruby/Rails Focus**: Docker-based RSpec testing, Ruby LSP, Rubocop linting
- **Git Workflow**: Visual hunks, staging, LazyGit integration
- **Fuzzy Finding**: Powerful Telescope with multiple pickers
- **Modern Completion**: Blink.cmp with LSP and snippet support
- **Session Management**: Auto-save and restore sessions per git branch
- **Debug Support**: Full DAP integration with UI

### Development Workflow

This configuration is optimized for:
1. Ruby/Rails development with Docker
2. Git-based workflows with visual feedback
3. AI-assisted coding
4. Fast file navigation and search
5. LSP-powered code intelligence
6. Automated formatting and linting

---

*Based on Kickstart.nvim framework*
*Plugin manager: lazy.nvim*
