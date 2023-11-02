Card = require("LuaBasics.spiderSolitaire.card")
CONSTS = require("LuaBasics.spiderSolitaire.consts")

-- Shuffles the deck
--
-- @param deck (table<card>) The deck of cards to shuffle
--
-- @return (table<card>) The now shuffled deck
local function shuffleDeck(deck)
    for i = #deck, 2, -1 do
        local newIndex = math.random(i)
        deck[i], deck[newIndex] = deck[newIndex], deck[i]
    end
    return deck
end

-- Sets the random seed for the program, used to truly randomize the shuffle functions results
math.randomseed(os.time())

-- Creates an ordered deck of cards with 104 different cards of 4 different suits numbered from 1 to 13 creating two of each, (the requirement for spider solitaire)
local deck = {}

for suit = 1, 4 do
    for rank = 1, 13 do
        table.insert(deck, Card:new(CONSTS.ranks[rank], CONSTS.suits[suit]))
        table.insert(deck, Card:new(CONSTS.ranks[rank], CONSTS.suits[suit]))
    end
end

-- Shuffles the deck
shuffleDeck(deck)

-- Prints out the current deck
print("Deck:")
for i = 1, #deck do
    print(Card.toString(deck[i]))
end
