require "./lib/caesar_cipher.rb"

describe "#sample test" do
  it "sample test with lower case" do
    expect(caesar_cipher("abc", 1)).to eql("bcd")
  end

  it "sample test with upper case  " do
    expect(caesar_cipher("ABCDE", 4)).to eql("EFGHI")
  end

  it "sample test with special charcters" do
    expect(caesar_cipher("!@#$%^&", 7)).to eql("!@#$%^&")
  end

  it "sampe test with mix of all" do
    expect(caesar_cipher("ac&^BF", 4)).to eql("eg&^FJ")
  end

  it "smaple test for last letters" do
    expect(caesar_cipher("xyzXYZ", 4)).to eql("bcdBCD")
  end
end
