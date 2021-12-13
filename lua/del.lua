local del_words = require("del_words")

local function filter(input, env)
  for cand in input:iter() do
    local inp = env.engine.context.input
    if cand.type == "completion" then
      local comment = cand:get_genuine().comment
      inp = inp .. string.match(comment, "^~(.+)$")
    end
    local del = false
    if del_words[inp] then
      for _,w in pairs(del_words[inp]) do
        if cand.text == w then
          del = true
        end
      end
    end
    if not del then
      yield(cand)
    end
  end
end

return filter
