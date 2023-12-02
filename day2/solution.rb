# For Every Line
    # save id
    # count red, count green, count blue
    # if 12 - nRed >= 0 and 13 - nGreen >= 0 and 14 - nGreen >= 0
        # return id
    # else
        # return 0
    # end
#

def addValidIds ()
    sum = 0
    File.readlines('input.txt', chomp: true).each do |row|
        sum = sum + 1
        puts getRowId(row)
    end
    sum
end

# returns the integer id of given row
def getRowId (row)
    # num is a string, Ik... but how else do I concat numbers easily??
    num = '0'
    i = 0
    while i < row.length
        if row[i].match? /\A\d+\z/
            num << row[i]
        end
        if row[i] == ':'
            return num
        end
        i = i + 1
    end
    return Integer(num)
end

puts addValidIds()
#puts getRowId('Game 123: 2 red, 2 green; 1 red, 1 green, 2 blue; 3 blue, 3 red, 3 green; 1 blue, 3 green, 7 red; 5 red, 3 green, 1 blue')