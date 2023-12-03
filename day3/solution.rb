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
    num, startIndex, endIndex = getNextNum(currentRow, 0)
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
    return -1, t, i
end

#addPartNumbers()
puts getNextNum('.664.598..', 0)