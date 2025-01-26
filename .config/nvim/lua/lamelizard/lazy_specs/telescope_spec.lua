return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = "cmake -S . -B build -DCMAKE_BUILD_TYPE=Release" ..
          " && cmake --build build --config Release" ..
          " && cmake --install build --prefix build",
    },
  },
  config = function() require 'lamelizard.telescope' end,
}

