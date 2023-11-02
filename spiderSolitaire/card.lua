local card = {
    rank = "Ace",
    suit = "Spades"
}

function card:new(rank, suit)
    local newCard = {}
    setmetatable(newCard, card)
    self.__index = self
    print(self)
    newCard.rank = rank
    newCard.suit = suit
    return newCard
end 

return card