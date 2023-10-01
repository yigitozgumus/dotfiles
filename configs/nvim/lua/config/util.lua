local M = {}

function M.require(mod)
	local ok, ret = M.try(require, mod)
	return ok and ret
end

function M.quit()
	local bufnr = vim.api.nvim_get_current_buf()
	local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
	if modified then
		vim.ui.input({
			prompt = "You have unsaved changes. Quit anyway? (y/n) ",
		}, function(input)
			if input == "y" then
				vim.cmd("q!")
			end
		end)
	else
		vim.cmd("q!")
	end
end

function M.t(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.warn(msg, name)
	vim.notify(msg, vim.log.levels.WARN, { title = name or "init.lua" })
end

function M.error(msg, name)
	vim.notify(msg, vim.log.levels.ERROR, { title = name or "init.lua" })
end

function M.info(msg, name)
	vim.notify(msg, vim.log.levels.INFO, { title = name or "init.lua" })
end

function M.float(fn, opts)
	local buf = vim.api.nvim_create_buf(false, true)
	local vpad = 4
	local hpad = 10

	opts = vim.tbl_deep_extend("force", {
		relative = "editor",
		width = vim.o.columns - hpad * 2,
		height = vim.o.lines - vpad * 2,
		row = vpad,
		col = hpad,
		style = "minimal",
		border = "rounded",
		noautocmd = true,
	}, opts or {})

	local enter = opts.enter == nil and true or opts.enter
	local win = vim.api.nvim_open_win(buf, enter, opts)

	local function close()
		if vim.api.nvim_buf_is_valid(buf) then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
		vim.cmd([[checktime]])
	end

	vim.keymap.set("n", "<ESC>", close, { buffer = buf, nowait = true })
	vim.keymap.set("n", "q", close, { buffer = buf, nowait = true })
	vim.api.nvim_create_autocmd({ "BufDelete", "BufLeave", "BufHidden" }, {
		once = true,
		buffer = buf,
		callback = close,
	})
	fn(buf, win)
end

function M.float_cmd(cmd, opts)
	M.float(function(buf)
		local output = vim.api.nvim_exec2(cmd, opts)
		local lines = vim.split(output, "\n")
		vim.api.nvim_buf_set_lines(buf, 0, -1, true, lines)
	end, opts)
end

function M.exists(fname)
	local stat = vim.loop.fs_stat(fname)
	return (stat and stat.type) or false
end

function M.fqn(fname)
	fname = vim.fn.fnamemodify(fname, ":p")
	return vim.loop.fs_realpath(fname) or fname
end

function M.clipman()
	local file = M.fqn("~/.local/share/clipman.json")
	if M.exists(file) then
		local f = io.open(file)
		if not f then
			return
		end
		local data = f:read("*a")
		f:close()

		-- allow empty files
		data = vim.trim(data)
		if data ~= "" then
			local ok, json = pcall(vim.fn.json_decode, data)
			if ok and json then
				local items = {}
				for i = #json, 1, -1 do
					items[#items + 1] = json[i]
				end
				vim.ui.select(items, {
					prompt = "Clipman",
				}, function(choice)
					if choice then
						vim.api.nvim_paste(choice, true, 1)
					end
				end)
			else
				vim.notify(("failed to load clipman from %s"):format(file), vim.log.levels.ERROR)
			end
		end
	end
end

function M.version()
	local v = vim.version()
	if v and not v.prerelease then
		vim.notify(
			("Neovim v%d.%d.%d"):format(v.major, v.minor, v.patch),
			vim.log.levels.WARN,
			{ title = "Neovim: not running nightly!" }
		)
	end
end

return M
