#
# Sample code to encrypt with 345
#
# plaintext  : 平文.
# cryptogram : 暗号文.
# calculation_result : 足し算した後のascii_codeの値を一時的に格納.
#
# TODO: unpack/pack の c* について調べる.

# 入力.
puts "平文を入力して下さい (例. OLIVA)"
plaintext = gets.chop # 文字列の最後に打ったキャリッジリターンが入るので chop で取り除く.
puts "-----------------------------------"
ascii_code = plaintext.unpack("c*") # アルファベット => アスキーコード.

# 鍵(345)を繰り返し足す.
calculation_result = []
secret_key = [3, 4, 5]
regression_index = 0

ascii_code.each do |item|
  puts regression_index
  calculation_result.push(item + secret_key[regression_index])
  regression_index += 1
  regression_index = 0 if regression_index > 2
end

cryptogram = calculation_result.pack("c*") # アスキーコード => アルファベッド
puts "平文   : #{plaintext} #{ascii_code}
暗号文 : #{cryptogram} #{calculation_result}"


