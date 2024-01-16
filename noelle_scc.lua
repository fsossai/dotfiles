-- ~/.config/nvim/lua/noelle_scc.lua

-- Extract ID from an instruction
function extractID(inst)
  -- e.g. store i32 0, i32* %3, !noelle.pdg.scc.id !47
  -- 47 is what we are looking for
  local i, j = inst:find("!noelle.pdg.scc.id", 1, --[[plain=]]true)

  if i == nil then
    return nil
  end

  local value = inst:sub(j+1, inst:len())
  local id_i, id_j = value:find("%d+", 1)
  
  if id_i == nil then
    return nil
  end

  return tonumber(value:sub(id_i, id_j))
end

-- Generate a random color in HEX form e.g. #abcdef
function obtainColor(id)
  local color = colors[id]

  if color then
    return color
  end

  local function randomHex()
    return string.format("%02x", math.random(64, 255))
  end

  local red = randomHex()
  local green = randomHex()
  local blue = randomHex()

  color = "#" .. red .. green .. blue
  colors[id] = color
  return color
end

-- Create a new random syntax style
function createHighlight(id)
  return string.format(
    "highlight NoelleSCC%d guifg=%s", id, obtainColor(id)
  )
end

-- Create a vim syntax match for a given ID
function createSyntaxMatch(id)
  -- plain: /.*!noelle\.pdg\.scc\.id\s\+!123\(\d\)\@!/
  -- <anything> !noelle.pdg.scc.id <spaces> !<numbers><no more numbers>
  local regex = string.format(
    "/.*!noelle\\.pdg\\.scc\\.id\\s\\+!%d\\(\\d\\)\\@!/", id
  )
  return string.format("syntax match NoelleSCC%d %s", id, regex)
end

-- Read lines from input buffer
function getLines()
  local lines = {}
  while true do
    local line = io.read()
    if not line then
      break
    end
    table.insert(lines, line)
  end
  return lines
end

function createSyntaxCleaner(id)
  return string.format("syntax clear NoelleSCC%d ", id)
end

function enable(id)
  print(createHighlight(id))
  print(createSyntaxMatch(id))
end

function disable(id)
  print(createSyntaxCleaner(id))
end

function main()
  local lines = getLines()
  math.randomseed(os.time())
  
  colors = {}
  emitted = {}
  
  if arg[1] == "enable" then
    enable_or_disable = enable
  elseif arg[1] == "disable" then
    enable_or_disable = disable
  else
    return
  end

  for _, line in ipairs(lines) do
    local id = extractID(line)
    if id ~= nil then
      if not emitted[id] then
        enable_or_disable(id)
        emitted[id] = true
      end
    end
  end
end

main()

