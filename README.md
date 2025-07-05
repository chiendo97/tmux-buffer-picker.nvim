<h1 align="center">⛶&nbsp;&nbsp;tmux-buffer-picker.nvim&nbsp;&nbsp;⛶ </h1>

<p align="center">
  <a href="https://github.com/chiendo97/tmux-buffer-picker.nvim/actions/workflows/run-tests.yml">
    <img alt="Run Tests badge" src="https://img.shields.io/github/actions/workflow/status/chiendo97/tmux-buffer-picker.nvim/run-tests.yml?style=for-the-badge&label=Tests"/>
  </a>
  <a href="https://luarocks.org/modules/chiendo97/tmux-buffer-picker.nvim">
    <img alt="LuaRocks badge" src="https://img.shields.io/luarocks/v/chiendo97/tmux-buffer-picker.nvim?style=for-the-badge&color=5d2fbf"/>
  </a>
  <a href="https://github.com/chiendo97/tmux-buffer-picker.nvim/releases">
    <img alt="GitHub badge" src="https://img.shields.io/github/v/release/chiendo97/tmux-buffer-picker.nvim?style=for-the-badge&label=GitHub"/>
  </a>
  <a href="https://www.reddit.com/r/neovim/comments/195q8ai/template_for_writing_neovim_plugin/">
    <img alt="Reddit badge" src="https://img.shields.io/badge/post-reddit?style=for-the-badge&label=Reddit&color=FF5700"/>
  </a>
</p>

______________________________________________________________________

### 🛠️ Setup

- **Neovim** (≥ 0.10)

- **[luarocks](https://luarocks.org/)**, **[busted](https://lunarmodules.github.io/busted/)**, and **[nlua](https://github.com/mfussenegger/nlua)** (macOS [install.sh](https://gist.githubusercontent.com/chiendo97/44c573db63864bcd1dc0bfc73359fec9/raw/d92e3b3e5f3da1c8557e93250e6e8a7de0f7d09a/install-lua-luarocks-on-macos.sh) and [uninstall.sh](https://gist.githubusercontent.com/chiendo97/44c573db63864bcd1dc0bfc73359fec9/raw/d92e3b3e5f3da1c8557e93250e6e8a7de0f7d09a/uninstall-lua-luarocks-on-macos.sh) scripts)

- **[lazy.nvim](https://github.com/folke/lazy.nvim)** and **[lazydev.nvim](https://github.com/folke/lazydev.nvim)**

```lua
{
  {
    "tmux-buffer-picker.nvim",
    dir = "/path/to/tmux-buffer-picker.nvim",
    lazy = false,
    opts = {},
    keys = {
      {
        "<leader>rb",
        "<cmd>Lazy reload tmux-buffer-picker.nvim<cr>",
        desc = "Reload tmux-buffer-picker.nvim",
        mode = { "n", "v" },
      },
    },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        "${3rd}/luassert/library",
        "${3rd}/busted/library",
        "tmux-buffer-picker.nvim",
      }
    },
  },
}
```

### 📁 Plugin Structure

- ***plugin/tmux-buffer-picker.lua*** - the main file, the one loaded by the plugin manager.

- ***spec/tmux-buffer-picker_spec.lua*** - plugin tests. Add other ***\_spec.lua*** files here for further testing.

- ***lua/tmux-buffer-picker/***

  - ***init.lua*** - the main file of the plugin, the one loaded by ***plugin/tmux-buffer-picker.lua***.
  - ***health.lua*** - run checks of the plugin when `:checkhealth tmux-buffer-picker` is called.
  - ***types.lua*** - a [definition file](https://luals.github.io/wiki/definition-files/) where LuaCATS annotations are defined.

### 🔍 Lua Language Server

[Lua Language Server](https://github.com/luals/lua-language-server?tab=readme-ov-file) (LuaLS) is a language server providing autocompletion, hover, diagnostics, annotations support, formatting. The `lazydev.nvim` plugin takes care of configuring it properly.

- ***.editorconfig*** - file format for defining coding styles (cross-editor).

### 🧪 Tests

[Busted](https://lunarmodules.github.io/busted/) is a unit testing framework for Lua. Using [nlua](https://github.com/mfussenegger/nlua) as Lua interpreter gives you access to Neovim Lua API while running tests. To run tests, simply run `busted` from the root of the plugin.

- ***.busted*** - configuration file for Busted which specifies nlua as the Lua interpreter.

### 📚 Documentation

It's important to document your plugin in the Vim/Neovim way so it's easily accessible from within the editor.

- ***doc/tmux-buffer-picker.txt*** - documentation file for the plugin formatted as vimdoc.

### 📦 CI/CD

It's no secret that the Neovim plugin ecosystem can be brittle. Prove them wrong with:

- ***.github/workflows/***
  - ***run-tests.yml*** - workflow to run tests on every push to the main branch.
  - ***run-typecheck.yml*** - workflow to typecheck code on every push.
  - ***release-github.yml*** - workflow to create a new release on GitHub on every push to the main branch.
  - ***release-luarocks.yml*** - workflow to create a new release on LuaRocks on every release on GitHub.

Write your commit messages following [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification and let the CI/CD do the rest.

### 👏 Resources

Neovim is growing a nice ecosystem, but some parts of plugin development are sometimes obscure. This template is an attempt to put together some best practices. Here are sources on which this template is tmux-buffer-pickerd and that I constantly refer to:

- [nvim-best-practices](https://github.com/nvim-neorocks/nvim-best-practices): Collection of DOs and DON'Ts for modern Neovim Lua plugin development
- [nvim-lua-plugin-template](https://github.com/nvim-lua/nvim-lua-plugin-template/): Another template for Neovim Lua plugins
- [LuaCATS annotations](https://luals.github.io/wiki/annotations/): Add type annotations to your Lua code
- [Plugin development walkthrough](https://youtu.be/n4Lp4cV8YR0?si=lHlxQBNvbTcXPhVY) by [TJ DeVries](https://github.com/tjdevries): it uses plenary instead of busted for testing
