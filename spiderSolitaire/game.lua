Card = require("LuaBasics.spiderSolitaire.card")
CONSTS = require("LuaBasics.spiderSolitaire.consts")

local deck = {}

for suit = 1, 4 do
    for  rank = 1, 13 do
        table.insert(deck, Card:new(CONSTS.ranks[rank], CONSTS.suits[suit]))
    end
end

for i = 1, #deck do
    print(deck[i].rank .. " of " .. deck[i].suit)
end