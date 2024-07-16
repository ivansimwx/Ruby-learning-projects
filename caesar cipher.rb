def caesar_string(string, shift)
  byteArray = string.bytes

  #shift byte value of alphabets 
  shiftedbyteArray = byteArray.map do |byte| 
    case byte
    when 86..90
      (byte + 5 - 90 + 64).chr
    when 118..122
      (byte + 5 - 122 + 96).chr
    when (65..85), (97..117)
      (byte + 5).chr
    else
      byte.chr
    end
  end

  #convert byte to char
  finalArray = shiftedbyteArray.join
  puts finalArray

end

caesar_string("What a string!", 5)