# For Every Line
    # save id DONE
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
        sum += analyzeRow(row)
        rowId,index=getNextNum(row, 0)
    end
    sum
end

def analyzeRow (row)
    # if valid => return id, else return 0
    while true
        if startIndex >= row.length
            return 0 # maybe not zero, but rather whatever has been gathered
        end
        
    end
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
            puts "returned from , shizazzle"
            return Integer(num), i
        elsif row[i].match? /\A\d+\z/
            puts "concated num bitch"
            num << row[i]
            puts "num is now " + num
        end
        i += 1
    end
    return -1, i
    #return Integer(num), i + 1
end

def countGreen (row, startIndex)
    return getNextNum(row, startIndex)
end

def getNextColor (row, startIndex)
    word = ''
    i = startIndex
    while i < row.length
        # assumes that startindex has been incremented after getNextColor. 
        if row[i] == ';' || row[i] == ',' || row[i] == ' '
            return word, i
        end
        word << row[i]
        i += 1
    end
end

#puts addValidIds()
# should be 12
row = 'Game 123: 2 red, 2 green; 1 red, 1 green, 2 blue; 3 blue, 3 red, 3 green; 1 blue, 3 green, 7 red; 5 red, 3 green, 1 blue'
#works
rowId,index=getNextNum(row, 0)
puts rowId

num,index2=getNextNum(row, index + 1)
puts num
word,index3=getNextColor(row, index2 + 1)
puts word

#works
#num,index500=getNextNum(row, 15 + 1)
#puts getNextColor(row, index500 + 1)