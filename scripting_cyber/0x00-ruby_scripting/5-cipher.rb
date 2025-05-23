#!/usr/bin/env ruby
class CaesarCipher
  def initialize(shift)
    @shift = shift % 26
  end

  def encrypt(message)
    cipher(message, @shift)
  end

  def decrypt(message)
    cipher(message, -@shift)
  end

  private

  def cipher(msg, shift)
    msg.tr("A-Za-z", ("A".."Z").to_a.rotate(shift).join + ("a".."z").to_a.rotate(shift).join)
  end
end
