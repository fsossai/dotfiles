-- ~/.config/nvim/lua/comment.lua

function contains(list, val)
  for _, x in ipairs(list) do
    if x == val then
      return true
    end
  end
  return false
end

function getLeftMostColumn(lines)
  local minColumn = math.huge

  for _, line in ipairs(lines) do
    local column = 1
    for char in line:gmatch(".") do
      if char ~= " " then
        minColumn = math.min(minColumn, column)
        break
      end
      column = column + 1
    end
  end

  return minColumn
end

-- Get the right symbol based on the extension
function getCommentSymbol()
  local ext = arg[1]
    if contains({
      "java","cpp","c","cs","js", "rs","go","swift",
      "json","kt","ts"}, ext) then
      return "// "
    elseif contains({"py","sh","awk","rb","pl"}, ext) then
      return "# "
    elseif contains({"f90","f"}, ext) then
      return "! "
    elseif contains({"ll"}, ext) then
      return "; "
    elseif contains({"lua"}, ext) then
      return "-- "
    else
      return ""
  end
end

-- Insert comment symbol in each line
function processLines(lines, position)
  local result = {}
  local symbol = getCommentSymbol()
  for _, line in ipairs(lines) do
    local modifiedLine =
      line:sub(1, position - 1) .. symbol .. line:sub(position)
    table.insert(result, modifiedLine)
  end
  return result
end

function comment()
  -- Read lines from io.read
  local lines = {}
  while true do
    local line = io.read()
    if not line then
      break
    end
    table.insert(lines, line)
  end

  local position = getLeftMostColumn(lines)
  local modifiedLines = processLines(lines, position)

  for _, line in ipairs(modifiedLines) do
    print(line)
  end
end

comment()
