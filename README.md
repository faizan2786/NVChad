This repo is my custom **NvChad config** for **NeoVim**.

It is **forked** from [NvChad:starter](https://github.com/NvChad/starter) repo. The `starter` repo loads plugins from [NvChad/NvChad](https://github.com/NvChad/NvChad) master repo `V2.5` 
and use it as a base `nvim` config and allows for customisation on top of it using custom `plugins` and `configs` folder defined in the top-level `lua` directory.

This config mainly includes the following:
- Syntax highlighters for lua, python and c++ language files.
- A Python LSP [Pyright](https://github.com/microsoft/pyright).
- Python diagonostic tools such as linter and static type analyser configured using [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main).
- A C++ LSP [clangd](https://clangd.llvm.org/).
- It also configures auto formatting on save for C++ and Python using following formatters:
  - `clang-format` - for C++
  - `Black` - for Python
