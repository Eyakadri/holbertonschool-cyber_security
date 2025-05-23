#!/usr/bin/env ruby
class CaesarCipher
  def initialize(shift)
    @shift = shift % 26
  end

  def encrypt(msg)
    cipher(msg, @shift)
  end

  def decrypt(msg)
    cipher(msg, -@shift)
  end

  private

  def cipher(msg, shift)
    msg.tr("A-Za-z", ("A".."Z").to_a.rotate(shift).join + ("a".."z").to_a.rotate(shift).join)
  end
end
