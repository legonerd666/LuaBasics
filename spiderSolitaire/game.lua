Card = require("LuaBasics.spiderSolitaire.card")
CONSTS = require("LuaBasics.spiderSolitaire.consts")

-- Shuffles the deck
--
-- @param deck (&table<&card>) The deck of cards to shuffle
local function shuffleDeck(deck)
    for i = #deck, 2, -1 do
        local newIndex = math.random(i)
        deck[i], deck[newIndex] = deck[newIndex], deck[i]
    end
end



-- @return (number) The pile index accepting a number from 1-10
local function pickValidPile()
    io.write("Pick a pile: ")
    local pileIndex = tonumber(io.read())
    if pileIndex ~= nil and pileIndex >= 1 and pileIndex <= 10 then
        return pileIndex
    end
    return pickValidPile()
end



-- Prints a formatted version of the card if visible
--
-- @param card (&card)
local function printCard(card)
    if not card.isVisible then
        print("Unknown")
        return
    end
    print(Card.toString(card))
end



-- Prints out all the cards in a pile
--
-- @param pile (&table<&card>) The pile to print
local function printPile(pile)
    for cardIndex = 1, #pile do
        printCard(pile[cardIndex])
    end
end



-- Prints out all the piles
--
-- @param piles (&table<&table<&card>>)
local function printPiles(piles)

    for i = 1, #piles do
        print("Pile " .. i .. ":")
        printPile(piles[i])
        print()
    end

end


-- Takes all the visible cards from the origin pile and adds them to a list of cards to move and then removes them from the origin pile
--
-- @param originPile (&table<&card>) The pile to move cards from
--
-- @param cardsToMove (&table<&card>) The pile of cards to be moved to the new pile
local function setCardsToMove(originPile, cardsToMove)
    
    for i = 1, #originPile do
        if originPile[i].isVisible then
            table.insert(cardsToMove, originPile[i])
        end
    end

    -- Removes the cards in cards to move from the origin pile
    for i = 1, #cardsToMove do
        table.remove(originPile, #originPile)
    end
end



-- @param cardsToMove (&table<&card>) The list of cards that need to be moved to the destination pile
--
-- @param destinationPile (&table<&card>) The pile to put the card to move cards in
local function addCardsToPile(cardsToMove, destinationPile)
    for i = 1, #cardsToMove do
        table.insert(destinationPile, cardsToMove[i])
    end
end



-- @param originPile (&table<&card>) The pile to move cards from
--
-- @param destinationPile (&table<&card) The pile to move cards to
local function moveVisibleCards(originPile, destinationPile)

    local cardsToMove = {}
    setCardsToMove(originPile, cardsToMove)
        
    -- Sets the top face down card, if there is one, to be visible in the origin pile
    if #originPile > 0  then
        originPile[#originPile].isVisible = true
    end
        
    -- Adds the cards to move to the new pile
    addCardsToPile(cardsToMove, destinationPile)

end



-- Runs the main game loop allowing the user to move cards between piles via the console
--
-- @param piles (&table<&table<&card>>) The ten piles in which the game is played
--
-- @param deck (&table<&card>) The deck of cards to deal from
local function gameLoop(piles, deck)
    printPiles(piles)

    print("Pick the pile you want to move from: ")
    local activePileIndex = pickValidPile()

    print("Pick the pile you want to move the visible cards to: ")
    local newPileIndex = pickValidPile()

    -- Makes sure we don't try to move a deck to the same spot
    if activePileIndex == newPileIndex then
        gameLoop(piles, deck)
    end

    moveVisibleCards(piles[activePileIndex], piles[newPileIndex])
    gameLoop(piles, deck)

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

-- Creates the piles of cards for the game to be played in
local piles = {
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {},
    {}
}

-- Deals 5 cards into each pile 1 at a time, making sure to put one into each pile before putting another into the first
for i = 1, 5 do
    for pile = 1, #piles do
        table.insert(piles[pile], deck[1])
        table.remove(deck, 1)
    end
end

-- Deals 1 extra card into each of the first 4 piles
for i = 1, 4 do
    table.insert(piles[i], deck[1])
    table.remove(deck, 1)
end

-- Sets the final/top card of each pile as visible
for i = 1, #piles do
    local currentPile = piles[i]
    local lastIndex = #currentPile

    currentPile[lastIndex].isVisible = true
end

-- -- Prints out the current deck
-- print("Deck:")
-- for i = 1, #deck do
--     print(Card.toString(deck[i]))
-- end

gameLoop(piles, deck)

