#
# Sample code to dencrypt with 0 ~ inputed number
#
# cryptogram : 暗号文.
# decrypted_text  : 復号文.
# calculation_result : 足し算した後のascii_codeの値を一時的に格納.
#
# TODO: unpack/pack の c* について調べる.

# 入力.
puts "暗号文を入力して下さい(例. RPNYE)"
cryptogram = gets.chop # 文字列の最後に打ったキャリッジリターンが入るので chop で取り除く.
puts "0~NのNに当たる数値を入力して下さい(例. 999)"
max_number = gets.chop.to_i
puts "-----------------------------------"

# "RPNYE" => [82, 80, 78, 89, 69]
ascii_code = cryptogram.unpack("c*")

(0..max_number).to_a.each do |num| # ex. 345
  regression_index = 0
  calculation_result = []
  secret_key = num.to_s.split("") # ex. ["3", "4", "5"]

  ascii_code.each do |item| # ex. [82, 80, 78, 89, 69]
    calculation_result.push(item - secret_key[regression_index].to_i)
    regression_index += 1
    regression_index = 0 if regression_index > secret_key.length - 1
  end

  decrypted_text = calculation_result.pack("c*") # [79, 76, 73, 86, 65] => "OLIVA"

  puts "#{num} : #{decrypted_text} : #{calculation_result}"
end


