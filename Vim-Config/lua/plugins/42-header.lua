return {
  "42-header-plugin",
  lazy = false,
  config = function()
    vim.keymap.set("n", "<F4>", function()
      local header_path = vim.fn.expand("~/.config/nvim/Other/42/42-header.txt")

      -- Vérifie si le fichier header existe
      if vim.fn.filereadable(header_path) == 0 then
        vim.notify("Header file not found: " .. header_path, vim.log.levels.ERROR)
        return
      end

      -- Lit le fichier header
      local header_lines = vim.fn.readfile(header_path)
      if not header_lines or #header_lines == 0 then
        vim.notify("Header file is empty.", vim.log.levels.WARN)
        return
      end

      -- Insère le header au début du buffer
      vim.api.nvim_buf_set_lines(0, 0, 0, false, header_lines)
      vim.notify("42 header inserted!", vim.log.levels.INFO)
    end, { desc = "Insert 42 header", silent = true })
  end,
}

