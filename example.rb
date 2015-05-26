class Anagram

  def initialize(word_a, word_b)
    @word_a = word_a
    @word_b = word_b
  end

  def true?
  hash_a = {}
  hash_b = {}

    @word_a.each_char do |a|
      hash_a[a.to_sym] = hash_a[a.to_sym].to_i + 1
    end

      @word_b.each_char do |b|
      hash_b[b.to_sym] = hash_b[b.to_sym].to_i + 1
    end

    if hash_a == hash_b
      return true
    else
      return false
    end
  end

end
