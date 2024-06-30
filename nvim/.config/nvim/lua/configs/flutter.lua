local M = {}

-- -- Flutter Test
-- M.flutter_test = function()
--   vim.fn.setqflist {}
--   local output = vim.fn.system "flutter test --machine"
--   for line in vim.gsplit(output, "\n") do
--     if line:match '"status":"failed"' then
--       local json = vim.fn.json_decode(line)
--       vim.fn.setqflist({ {
--         filename = json.test,
--         text = "Test failed: " .. json.message,
--       } }, "a")
--     end
--   end
--   vim.cmd "copen"
-- end
--

M.flutter_test = function()
  -- Clear the quickfix list
  vim.fn.setqflist {}

  -- Run the Flutter test command and capture the output
  local output = vim.fn.systemlist "flutter test --machine"

  -- Iterate over each line of the output
  for _, line in ipairs(output) do
    -- Skip empty lines
    if line and line ~= "" then
      local success, json = pcall(vim.fn.json_decode, line)
      if success and json then
        if json.type == "error" then
          -- Extract relevant information
          local filename = json.url or "unknown"
          local message = json.error or "Unknown error"
          local lnum = json.line or 1

          -- Set the quickfix list entry
          vim.fn.setqflist({
            {
              filename = filename,
              text = message,
              lnum = lnum,
            },
          }, "a")
        end
      end
    end
  end

  -- Open the quickfix list
  vim.cmd "copen"
end

-- Find Hardcoded Strings
M.find_hardcoded_strings = function()
  vim.fn.setqflist {}
  local output = vim.fn.system "grep -Rn \"'[^']*'\" lib --include='*.dart'"
  for line in vim.gsplit(output, "\n") do
    local file, lineNum, content = unpack(vim.split(line, ":", true))
    vim.fn.setqflist({ {
      filename = file,
      lnum = tonumber(lineNum),
      text = content,
    } }, "a")
  end
  vim.cmd "copen"
end

return M
