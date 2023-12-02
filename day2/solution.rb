def addValidIds ()
    sum = 0
    File.readlines('input.txt', chomp: true).each do |row|
        sum += analyzeRow(row)
    end
    sum
end

def analyzeRow (row)
    nGreen = 0
    nRed = 0
    nBlue = 0
    id, i = getNextNum(row, 0)
    while i <= row.length
        if row[i] == ';'
            if nRed > 12 || nGreen > 13 || nBlue > 14
                return 0
            else
                nGreen = 0
                nRed = 0
                nBlue = 0
            end
        end

        num, i = getNextNum(row, i + 1)
        color, i = getNextColor(row, i + 1)
        if color == 'green'
            nGreen += num
        elsif color == 'red'
            nRed += num
        elsif color == 'blue'
            nBlue += num
        end
    end
    if nRed > 12 || nGreen > 13 || nBlue > 14
        return 0
    end
    puts "id is: " + String(id) + " nGreen: " + String(nGreen) + " nRed: " + String(nRed) + " nBlue: " + String(nBlue)
    return id
end

# returns the next (not really lol) integer and the index of its pos of given row
def getNextNum (row, startIndex)
    # num is a string, Ik... but how else do I concat numbers easily??
    num = ''
    i = startIndex
    while i < row.length
        if row[i] == ':'
            return Integer(num), i
        elsif row[i] == ' ' and num.length != 0
            return Integer(num), i
        elsif row[i] == ',' and num.length != 0
            return Integer(num), i
        elsif row[i].match? /\A\d+\z/
            num << row[i]
        end
        i += 1
    end
    return -1, i
end

def getNextColor (row, startIndex)
    word = ''
    i = startIndex
    while i < row.length
        if row[i] == ';' || row[i] == ',' || row[i] == ' '
            return word, i
        end
        word << row[i]
        i += 1
    end
    return word, i
end

puts addValidIds()
