local function add(num1, num2)
    return num1 + num2
end

local function subtract(num1, num2)
    return num1 - num2
end

local function multiply(num1, num2)
    return num1 * num2
end

local function divide(num1, num2)
    return num1 / num2
end

local function calculate(num1, num2, operator)
    if operator == "+" then
        return add(num1, num2)
    elseif operator == "-" then
        return subtract(num1, num2)
    elseif operator == "*" then
        return multiply(num1, num2)
    elseif operator == "/" then
        return divide(num1, num2)
    end
end

repeat
    print("Please enter a number: ")
    local num1 = io.read()
    print("Please enter the operator you would like to use (+ addition, - subtraction, * multiplication, / division): ")
    local operator = io.read()
    print("Please enter a number: ")
    local num2 = io.read()

    print(calculate(num1, num2, operator))

    print("Type \"exit\" to exit")
until io.read() == "exit"
