local b05 = 'rgba(0,0,0,0.5)'
local accent = '#B59E7A'

local bg0 = '#042327'
local bg1 = '#0c141f'
local bg2 = '#2A343E'

local text   = '#bdb395'
local dim    = '#A5B5BC'
local dim2   = '#bbbbbb'

local green  = '#31B72C'
local teal   = '#2ca198'
local teal2  = '#70c5bf'
local mint   = '#9DE3C0'

local keyword = '#CCCCCC'
local blue    = '#0000FF'
local red     = '#FF0000'
local orange  = '#B3661A'
local magenta = '#994D99'

--------------------------=--------------------------
local style  = require 'core.style'
local common = require 'core.common'
--------------------------=--------------------------

-- Core UI
style.background   = { common.color(bg0) }
style.background2  = { common.color(bg1) }
style.background3  = { common.color(bg2) }

style.text         = { common.color(text) }
style.caret        = { common.color('#86E08F') }
style.accent       = { common.color(accent) }
style.dim          = { common.color(dim) }

-- style.divider      = { common.color(accent) }
style.selection    = { common.color(blue) }

style.line_highlight = { common.color('#00000000') }

style.line_number  = { common.color(dim) }
style.line_number2 = { common.color(accent) }

style.scrollbar    = { common.color(accent) }
style.scrollbar2   = { common.color(dim) }

style.nagbar       = { common.color(red) }
style.nagbar_text  = { common.color(text) }
style.nagbar_dim   = { common.color(b05) }

-- Syntax
style.syntax = {}

-- fallback / default
style.syntax.normal = { common.color(text) }

-- text-like
style.syntax.string   = { common.color(teal) }
style.syntax.number   = { common.color(teal2) }
style.syntax.literal  = { common.color(blue) }

-- some Lite XL grammars use these instead of the above
style.syntax['string'] = style.syntax.string
style.syntax['number'] = style.syntax.number

-- constants (often used for numbers/booleans depending on language grammar)
style.syntax.constant = { common.color(teal2) }
style.syntax['constant'] = style.syntax.constant

-- identifiers
style.syntax.symbol   = { common.color(text) }

-- comments
style.syntax.comment  = { common.color(green) }

-- keywords
style.syntax.keyword  = { common.color(keyword) }
style.syntax.keyword2 = { common.color(mint) }

-- operators / functions
style.syntax.operator = { common.color(accent) }
-- treat function names / calls as normal text
style.syntax['function'] = { common.color(text) }
style.syntax['function.call'] = { common.color(text) }
style.syntax['function_call'] = { common.color(text) }

-- some grammars use this instead
style.syntax.support = { common.color(text) }
style.syntax['support.function'] = { common.color(text) }
style.syntax.symbol = { common.color(text) }

-- parens
style.syntax.paren1 = { common.color(magenta) }
style.syntax.paren2 = { common.color(orange) }
style.syntax.paren3 = { common.color(teal) }
style.syntax.paren4 = { common.color(blue) }
style.syntax.paren5 = { common.color(red) }

-- Lint (kept simple mapping)
style.lint = {}

style.lint.info    = { common.color(blue) }
style.lint.hint    = { common.color(green) }
style.lint.warning = { common.color(orange) }
style.lint.error   = { common.color(red) }
