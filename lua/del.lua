-- this filter needs to be put after "split_comment" filter
local function filter(input, env)
  -- skip reverse lookup words
  local skip = env.engine.context.input:sub(1,1) == "`"
  local candidates = {}
  local del_text = {}
  -- to keep remaining candidates in original order
  local index_text = {}
  for cand in input:iter() do
    if not skip then
      table.insert(index_text, cand.text)
      candidates[cand.text] = cand
      local comment = cand:get_genuine().comment
      local del = string.find(comment, "%[删%]") ~= nil
      if comment == "[删]" then
        table.insert(del_text, cand.text)
      end
      if cand.type == "completion" and del then
        table.insert(del_text, cand.text)
      end
    else
      yield(cand)
    end
  end
  for i, t in pairs(del_text) do
    candidates[t] = nil
  end
  for i, t in pairs(index_text) do
    if candidates[t] ~= nil then
      yield(candidates[t])
    end
  end
end

return filter
