vim.keymap.set("n", "<F4>", function()
  local header_path = vim.fn.expand("~/.config/nvim/Other/42/42-header.txt")
  local info_path = vim.fn.expand("~/.config/nvim/Other/42/42-userinfo.txt")

  -- Vérifie l'existence des fichiers
  if vim.fn.filereadable(header_path) == 0 then
    vim.notify("Header file not found: " .. header_path, vim.log.levels.ERROR)
    return
  end
  if vim.fn.filereadable(info_path) == 0 then
    vim.notify("User info file not found: " .. info_path, vim.log.levels.ERROR)
    return
  end

  -- Charge les fichiers
  local header_lines = vim.fn.readfile(header_path)
  local user_info = {}
  for _, line in ipairs(vim.fn.readfile(info_path)) do
    local key, value = line:match("^(%w+)%s*=%s*(.+)$")
    if key and value then
      user_info[key] = value
    end
  end

  -- Données dynamiques
  local filename = vim.fn.expand("%:t")
  local username = user_info["pseudo"] or "ton_pseudo"
  local email = user_info["email"] or "ton_email@domain.com"
  local date = os.date("%Y/%m/%d")

  -- Remplacements dynamiques
  for i, line in ipairs(header_lines) do
    line = line:gsub("{{FILENAME}}", filename)
    line = line:gsub("{{USERNAME}}", username)
    line = line:gsub("{{EMAIL}}", email)
    line = line:gsub("{{DATE}}", date)
    header_lines[i] = line
  end

  -- Insertion dans le buffer
  if not vim.bo.modifiable then
    vim.notify("Buffer is not modifiable.", vim.log.levels.ERROR)
    return
  end

  local ok, err = pcall(function()
    vim.api.nvim_buf_set_lines(0, 0, 0, false, header_lines)
  end)
  if not ok then
    vim.notify("Error inserting header: " .. tostring(err), vim.log.levels.ERROR)
    return
  end

  vim.notify("42 header inserted with user info!", vim.log.levels.INFO)
end, { desc = "Insert 42 header with user info", silent = true })

