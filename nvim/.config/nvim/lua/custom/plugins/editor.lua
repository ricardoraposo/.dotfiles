return {
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {}
    end,
  },
  { 'tpope/vim-sleuth' },
  {
    'stevearc/dressing.nvim',
    opts = {},
  }
  -- {
  --   'sahaj-b/brainrot.nvim',
  --   event = 'VeryLazy',
  --   opts = {
  --     phonk_time = 2.5, -- seconds the phonk/image overlay stays
  --     disable_phonk = false, -- skip phonk/overlay on "no errors"
  --     sound_enabled = true, -- enable sounds
  --     image_enabled = true, -- enable images (needs image.nvim)
  --     volume = 50, -- 0..100
  --   },
  -- },
  -- {
  --   '3rd/image.nvim',
  --   build = false,
  --   opts = {
  --     processor = 'magick_cli',
  --   },
  -- },
}
