local state = ya.sync(function()
	local yanked = {}

	for _, file in pairs(cx.yanked) do
		table.insert(yanked, ya.quote(tostring(file)))
	end

	return {
		cwd = ya.quote(tostring(cx.active.current.cwd)),
		yanked = table.concat(yanked, " "),
	}
end)

return {
	entry = function()
		local st = state()

		if st.yanked == "" then
			return
		end

		ya.manager_emit("shell", {
			confirm = true,
			"cp -a --reflink=always " .. st.yanked .. " " .. st.cwd,
		})
	end,
}
