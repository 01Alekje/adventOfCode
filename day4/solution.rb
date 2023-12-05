def findPoints ()
    sum = 0
    File.readlines('input.txt', chomp: true).each do |row|
        sum += analyzeRow(row)
    end
    sum
end

def analyzeRow (row)
    winningNumbers, scratchedNumbers = findNumbers(row)
    matching = 0
    i = 0
    while i < scratchedNumbers.length
        if winningNumbers.include? scratchedNumbers[i]
            matching += 1
        end
        i += 1
    end
    i = 0
    totPoints = 0
    #puts "matching: " + String(matching)
    while matching > 0
        #puts "totPoints: " + String(totPoints)
        if totPoints == 0
            totPoints = 1
            #puts "added 1 because 0"
        else
            totPoints += totPoints
            #puts "doubled because more than zero"
        end
        matching -= 1
    end
    totPoints
end

def findNumbers (row)
    winningNums = []
    scratchedNums = []
    currentNum = ''
    validIndex = false
    winning = true
    i = 0
    while i < row.length
        if row[i] == ":" then validIndex = true end
        if row[i].match? /\A\d+\z/ and validIndex
            currentNum << row[i]
        end
        if row[i] == "|" then winning = false end
        if row[i] == " " and currentNum.length > 0
            if winning
                winningNums.push(Integer(currentNum))
                currentNum = ''
            else
                scratchedNums.push(Integer(currentNum))
                currentNum = ''
            end
        end
        i += 1
    end
    if currentNum.length > 0 then scratchedNums.push(Integer(currentNum)) end
    return winningNums, scratchedNums
end

puts findPoints()