class Tokenizer
  ABBREVIATIONS = %w( Mrs. Dr. Mr. Ms. )
  PUNCTUATION = %w( . ! ? ,)

  def tokenize(input)
    abbreviations = ABBREVIATIONS.join('|')
    punctuation = PUNCTUATION.join
    input.gsub(/(#{abbreviations}|[#{punctuation}]{1})/, ' \1 ').split ' '
  end
end

class NGrams
  include Enumerable
  attr_accessor :n, :ngrams

  def initialize(ngrams)
    @ngrams = ngrams
    @n = @ngrams.first.count
  end

  class << self
    def ngrams(input, n=1)
      return input if n == 1
      output = []
      while input.size > n
        output << input.take(n)
        input.shift
      end
      output << input
    end

    def unigrams(input)
      ngrams(input, 1)
    end

    def bigrams(input)
      ngrams(input, 2)
    end

    def trigrams(input)
      ngrams(input, 3)
    end

    def stream(io=$stdin, n)
      buffer = []
      io.each_line do |l|
        buffer << l.chomp
        if buffer.count == n
          puts buffer.join('|')
          buffer.shift
        end
      end
    end
  end
end
