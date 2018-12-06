#
# Sample code to decrypt
#
# cryptogram : 暗号文
# decrypted  : 復号文
# subtracted : 引算した後のascii_codeの値を一時的に格納した値.
#
# TODO: unpack/pack の c* について調べる.

# 入力.
puts "暗号文を入力して下さい (例. ROLYD)"
cryptogram = gets.chop # 文字列の最後に打ったキャリッジリターンが入るので chop で取り除く.
puts "-----------------------------------"
ascii_code = cryptogram.unpack("c*") # アルファベット => アスキーコード.

# 0~9で引いた後、復号化して出力.
(0..9).to_a.each do |num|
  subtracted = []
  decrypted = []

  ascii_code.each do |item|
    subtracted.push(item - num)
  end

  decrypted = subtracted.pack("c*") # アスキーコード => アルファベッド
  puts "#{num} : #{decrypted} : #{subtracted}"
end


