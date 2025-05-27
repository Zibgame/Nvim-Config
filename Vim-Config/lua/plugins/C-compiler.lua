return {
  "lazyvim/lazyvim",
  keys = {
    {
      "<F5>",
      function()
        if vim.bo.filetype ~= "c" then
          vim.notify("Ce raccourci est uniquement pour les fichiers C", vim.log.levels.WARN, { timeout = 10000 })
          return
        end

        local filepath = vim.fn.expand("%:p")
        local output = vim.fn.expand("%:p:r")  -- même dossier, nom sans extension

        vim.cmd("w")

        local compile_cmd = string.format("gcc \"%s\" -o \"%s\" 2>&1", filepath, output)
        local compile_result = vim.fn.system(compile_cmd)

        if vim.v.shell_error ~= 0 then
          vim.notify("❌ Erreur de compilation :\n" .. compile_result, vim.log.levels.ERROR, { timeout = 10000 })
          return
        end

        local run_result = vim.fn.system(output)

        vim.notify("✅ Exécution terminée :\n\n" .. run_result, vim.log.levels.INFO, { timeout = 10000 })
      end,
      desc = "Compiler et exécuter (stdout dans notif)",
    },
  },
}


