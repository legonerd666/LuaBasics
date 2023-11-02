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

return card
