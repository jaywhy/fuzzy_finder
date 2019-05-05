class FuzzyFinder
  def initialize(list)
    @list = list
  end

  def search(search_string, algorithm = FuzzyFinder::AlgoV1)
    algorithm.run(@list, search_string)
  end
end


class FuzzyFinder
  Match = Struct.new(:string, :rank)
end

class FuzzyFinder
  module AlgoV1
    def self.run(list, search_string)
      list.map do |list_item|
        match = list_item.match(/#{search_string.split('').join('.*?')}/)
        Match.new(list_item, match[0].length) if match
      end.compact.sort_by(&:rank)
    end
  end

  module AlgoV2
  end
end
