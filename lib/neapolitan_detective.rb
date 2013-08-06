# パスタ解析機
class NeapolitanDetective
  attr_reader :mix_pasta, :neapolitan

  def initialize(mix_pasta, refrain, neapolitan)
    pasta_mixer = PastaMixer.new
    @mix_pasta = pasta_mixer.mix_pasta(mix_pasta, refrain, neapolitan)
    @neapolitan = neapolitan.reverse.split('')
  end

  def investigate_pasta
    @mix_pasta.split('').map {|str| mark_neapolitan(str) }.join
  end

  def mark_neapolitan(str)
    is_neapolitan?(str) ? "[#{str}]" : str
  end

  def is_neapolitan?(str)
    if @neapolitan.last == str
      @neapolitan.pop
      return true
    end
    false
  end
end