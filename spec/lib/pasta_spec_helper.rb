module PastaSpecHelper
  def how_many_include(target_str, included_str)
    original_size = target_str.size
    target_str.delete(included_str)
    return (original_size - target_str.size)
  end

  def how_many_include_in_string(target_str, included_str)
    how_many_include(target_str.split(''), included_str)
  end

  # 対象の文字列に含まれる文字の種類
  def char_type(target_str)
    target_str.uniq.size
  end
end
