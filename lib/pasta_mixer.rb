# 問題文用パスタ混ぜ機
class PastaMixer
  def mix_pasta(base_string, refrain, add_string)
    random_insert(generate_random_satement(base_string,refrain), add_string).join
  end

  def generate_random_satement(base_string,refrain = 1)
    (base_string * refrain).split("").shuffle!
  end

  def random_insert(base_array, add_string)
    from_position = 0
    add_string.split('').map do |add_char|
      insert_position = randome_position(from_position, base_array.size)
      base_array.insert(insert_position, add_char)
      from_position = insert_position + 1 #次回の挿入位置が今回より後ろになるように
    end
    base_array
  end

  # ロジックの都合上どうしても検索対象文字列が右に寄るのでadjust_rate をかけてすこし挿入位置を左に寄せている
  def randome_position(from_position, to_position)
    result = []
    adjust_rate = 0.4
    1.times { result << (from_position + rand((to_position - from_position) * adjust_rate).to_i) }
    result[0]
  end
end