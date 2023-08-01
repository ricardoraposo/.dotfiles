require("gopher").setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "$GOPATH/bin/gotests", -- also you can set custom command path
    impl = "impl",
    iferr = "iferr",
  },
}
