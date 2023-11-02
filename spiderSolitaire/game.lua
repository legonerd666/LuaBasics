Card = require("LuaBasics.spiderSolitaire.card")

local firstCard = Card:new("King", "Diamonds")

print(firstCard.rank .. " of " .. firstCard.suit)