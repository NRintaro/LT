#
# Sample code to decrypt with 0~9
#
# cryptogram : 暗号文.
# decrypted_text  : 復号文.
# calculation_result : 引算した後のascii_codeの値を一時的に格納.
#
# TODO: unpack/pack の c* について調べる.

# 入力.
puts "暗号文を入力して下さい (例. ROLYD)"
cryptogram = gets.chop # 文字列の最後に打ったキャリッジリターンが入るので chop で取り除く.
puts "-----------------------------------"

# "ROLYD" => [82, 79, 76, 89, 68]
ascii_code = cryptogram.unpack("c*")

# 0~9で引いた後、復号化して出力.
(0..9).to_a.each do |num|
  calculation_result = []
  decrypted_text = []

  ascii_code.each do |item|
    calculation_result.push(item - num)
  end

  decrypted_text = calculation_result.pack("c*") # [79, 76, 73, 86, 65] => "OLIVA"

  puts "#{num} : #{decrypted_text} : #{calculation_result}"
end


