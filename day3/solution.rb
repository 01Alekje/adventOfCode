def addPartNumbers ()
    sum = 0
    partList = File.readlines('input.txt', chomp: true)
    topRow = ''
    currentRow = ''
    bottomRow = ''
    i = 0
    while i < partList.length
        if i > 0 then topRow = partList[i - 1] end
        currentRow = partList[i]
        if i < partList.length - 1 then bottomRow = partList[i + 1] else bottomRow = '' end
        
        sum += getRowNumbers(topRow, currentRow, bottomRow)
        i += 1
    end
    return sum
end

# recieves top, current and bottom row. 
# Returns part-numbers for currentRow
def getRowNumbers (topRow, currentRow, bottomRow)
    totNum = 0
    endIndex = 0
    while endIndex < currentRow.length
        num, startIndex, endIndex = getNextNum(currentRow, endIndex)
        if checkRow(topRow, startIndex, endIndex)
            totNum += num
        elsif checkRow(currentRow, startIndex, endIndex)
            totNum += num
        elsif checkRow(bottomRow, startIndex, endIndex)
            totNum += num
        end
    end
    puts "total for " + currentRow + " is " + String(totNum)
    totNum
end

def checkRow (row, nSIndex, nEIndex)
    if row.length == 0 then return false end
    if nSIndex > 0 then nSIndex = nSIndex - 1 end
    while nSIndex <= nEIndex # add equal here
        if row[nSIndex] == nil then return false end
        if !row[nSIndex].match? /\A\d+\z/ and row[nSIndex] != '.' then return true end
        nSIndex += 1
    end
    false
end

# returns first number, index of where it starts (t), and index where it ends (i)
def getNextNum (row, startIndex)
    # num is a string, Ik... but how else do I concat numbers easily??
    num = ''
    # t is the index of where the number actually starts
    t = startIndex
    # i is the iterative and index of where the number ends
    i = startIndex
    while i < row.length
        if row[i].match? /\A\d+\z/
            if num.length == 0 then t = i end
            num << row[i]
        elsif num.length != 0
            return Integer(num), t, i
        end
        i += 1
    end
    if num.length == 0 then return 0, t, i end
    return Integer(num), t, i
end

puts addPartNumbers()