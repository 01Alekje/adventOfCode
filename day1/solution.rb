@h = Hash.new
@h['one'] = 1
@h['two'] = 2
@h['three'] = 3
@h['four'] = 4
@h['five'] = 5
@h['six'] = 6
@h['seven'] = 7
@h['eight'] = 8
@h['nine'] = 9

def scanFile ()
    sum = 0
    File.readlines('input.txt', chomp: true).each do |line|
        sum = sum + Integer(getRowData(line))
    end
    sum
end

def getRowData (row)
    # need ugly '' for concatenation... maybe?
    if getLastNum(row) != 0
        return String(getFirstNum(row)) + String(getLastNum(row))
    else
        return String(getFirstNum(row))
    end
end

# just like getLastNum :(
def getFirstNum (row)
    num = 0
    i = 0
    while i < row.length
        word = ''

        if row[i].match? /\A\d+\z/
            return row[i]
        end

        j = i
        while j < row.length
            word << row[j]
            if @h[word] != nil
                num = @h[word]
                return num
            end
            j = j + 1
        end
        i = i + 1
    end
    num
end

# just like getFirstNum :(
def getLastNum (row)
    num = 0
    i = row.length - 1
    while i >= 0
        word = ''

        if row[i].match? /\A\d+\z/
            return row[i]
        end

        j = i
        while j >= 0
            word << row[j]
            if @h[word.reverse()] != nil
                num = @h[word.reverse()]
                return num
            end
            j = j - 1
        end
        i = i - 1
    end
    num
end

puts scanFile()