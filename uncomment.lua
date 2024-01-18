-- ~/.config/nvim/lua/uncomment.lua

function contains(list, val)
  for _, x in ipairs(list) do
    if x == val then
      return true
    end
  end
  return false
end

-- Get the right symbol based on the extension
function getCommentSymbol()
  local ext = arg[1]
    if contains({
      "java","cpp","c","h","hpp","cs","js", "rs","go","swift",
      "json","kt","ts"}, ext) then
      return "//"
    elseif contains({"py","sh","awk","rb","pl"}, ext) then
      return "#"
    elseif contains({"f90","f"}, ext) then
      return "!"
    elseif contains({"ll"}, ext) then
      return ";"
    elseif contains({"lua"}, ext) then
      return "--"
    else
      return ""
  end
end

function removeFirstOccurrence(line, pattern)
  local i, j = line:find(pattern, 1, true)
  if i == nil then
    return line
  else
    return line:sub(1, i-1) .. line:sub(j+2, line:len())
  end
end

-- Remove comment symbol in each line
function processLines(lines)
  local result = {}
  local symbol = getCommentSymbol()

  for _, line in ipairs(lines) do
    table.insert(result, removeFirstOccurrence(line, symbol))
  end
  return result
end

function uncomment()
  -- Read lines from io.read
  local lines = {}
  while true do
    local line = io.read()
    if not line then
      break
    end
    table.insert(lines, line)
  end

  local modifiedLines = processLines(lines)

  for _, line in ipairs(modifiedLines) do
    print(line)
  end
end

uncomment()
