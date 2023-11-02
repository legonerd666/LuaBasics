CONSTS = require("LuaBasics.spiderSolitaire.consts")

local card = {
    rank = "Invalid Rank",
    suit = "Invalid Suit"
}

function card:new(rank, suit)
    local newCard = {}
    setmetatable(newCard, card)
    self.__index = self
    newCard.rank = rank
    newCard.suit = suit
    return newCard
end

-- @param card (card(table)) The card to convert to a String
--
-- @return (string) Nicely formatted String of the cards values
function card.toString(card)
    return card.rank .. " of " .. card.suit
end



function card.rankToValue(card)
    local rankToValue = {
        [CONSTS.ranks[1]] = 1,
        [CONSTS.ranks[2]] = 2,
        [CONSTS.ranks[3]] = 3,
        [CONSTS.ranks[4]] = 4,
        [CONSTS.ranks[5]] = 5,
        [CONSTS.ranks[6]] = 6,
        [CONSTS.ranks[7]] = 7,
        [CONSTS.ranks[8]] = 8,
        [CONSTS.ranks[9]] = 9,
        [CONSTS.ranks[10]] = 10,
        [CONSTS.ranks[11]] = 11,
        [CONSTS.ranks[12]] = 12,
        [CONSTS.ranks[13]] = 13
    }
    return rankToValue[card.rank] or -1
end



return card

