local keys = {}
for i = 6, 9 do
  table.insert(keys, {
    "<leader>" .. i,
    function()
      require("harpoon"):list():select(i)
    end,
    desc = "Harpoon to File " .. i,
  })
end

return {
  "ThePrimeagen/harpoon",
  keys = keys,
}
