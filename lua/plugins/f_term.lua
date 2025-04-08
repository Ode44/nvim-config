local state = {
  floating = {
    buf = -1,
    win = -1
  }
}

local function create_f_term_win(opts)
  opts = opts or {}

  -- Get the current screen dimensions
  local width = vim.o.columns
  local height = vim.o.lines
  
  -- Define the floating window size (80% of screen width/height)
  local win_width = math.floor(width * 0.7)
  local win_height = math.floor(height * 0.7)
  
  -- Calculate the position to center the window
  local row = math.floor((height - win_height) / 2)
  local col = math.floor((width - win_width) / 2)

  --do not re-create buffer from if it is was created before 
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end
  
  -- Define the window options
  local window_config = {
    col = col,           -- Position the window horizontally (centered)
    row = row,           -- Position the window vertically (centered)
    relative = 'editor', -- Float above curren nvim instance
    width = win_width,   -- Set the width of the window
    height = win_height, -- Set the height of the window
    style = 'minimal',   -- Minimal window (no borders, etc.)
    border = 'rounded',    -- Optional: single border around the window
  }

  local win = vim.api.nvim_open_win(buf, true, window_config)
  return { buf = buf, win = win }
end

local toggle_terminal = function()
--do not re-create window if it was openen at least once
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_f_term_win { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else 
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Fterm", toggle_terminal, {})

