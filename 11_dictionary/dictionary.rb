class Dictionary
    def initialize
        @entries = {}
    end

    def entries
        @entries
    end

    def keywords
        @entries.keys
    end

    def add(pairings)
        if pairings.is_a?(String)
            @entries[pairings] = nil 
        else
            pairings.each do |word, definition|
                @entries[word] = definition
            end
        end
    end

    def include?(keyword)
        @entries.keys.include?(keyword)
    end
end
