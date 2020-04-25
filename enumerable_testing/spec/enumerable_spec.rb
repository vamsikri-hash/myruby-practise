require "./lib/enumerables.rb"

describe "tests on re-written ruby enumerables" do
  before { @list = [1, 2, 3, 4, 5] }

  context "test on my_each alias for each" do
    it "#iterate over a list and add some number" do
      result = []
      @list.my_each { |i| result << i + 3 }
      expect(result).to eq([4, 5, 6, 7, 8])
    end

    it "#iterate over a list and multiply with some number" do
      result = []
      @list.my_each do |i|
        result << i * 3
      end
      expect(result).to eq([3, 6, 9, 12, 15])
    end
  end
  context "test on my_each_with_index alias to each_with_index" do
    it "#iterate over list and multiply index with data" do
      result = []
      @list.my_each_with_index { |i, v| result << i * v }
      expect(result).to eq([0, 2, 6, 12, 20])
    end
    it "#iterate over list and multiply index with data and with do end block" do
      result = []
      @list.my_each_with_index do |i, v|
        result << i * v
      end
      expect(result).to eq([0, 2, 6, 12, 20])
    end
  end
  context "test on my_select alias select" do
    it "#return the even nums from list" do
      expect(@list.my_select { |i| i % 2 == 0 }).to eq([2, 4])
    end

    it "#returns odd nums from list with do en block" do
      expect(@list.my_select { |i| i % 2 != 0 }).to eq([1, 3, 5])
    end
  end

  context "test on my_all? alias all?" do
    it "#return true if all are even" do
      expect([2, 4, 6].my_all? { |i| i.even? }).to eq(true)
    end
    it "#return false if all are not even" do
      expect([2, 4, 7].my_all? { |i| i.even? }).to eq(false)
    end
  end

  context "test on my_any? alias for any?" do
    it "#return true if any num is even" do
      expect([1, 2, 3, 5, 7, 9].my_any? { |i| i.even? }).to eq(true)
    end
    it "#return false if any num is not even" do
      expect([1, 3, 5, 7, 9].my_any? { |i| i.even? }).to eq(false)
    end
  end
  context "test on my_none? alias for none?" do
    it "#return true if none of  num is even" do
      expect([1, 3, 5, 7, 9].my_none? { |i| i.even? }).to eq(true)
    end
    it "#return false if any num is  even" do
      expect([1, 3, 5, 7, 2, 9].my_none? { |i| i.even? }).to eq(false)
    end
  end

  context "test on my_count alias count" do
    it "# return length of array" do
      expect([1, 2, 3, 4, 5, 6].count).to eq(6)
    end
  end

  context "test on my_map alias for map" do
    it "#take an array and multiply every element by 2" do
      expect(@list.map { |i| i * 2 }).to eq([2, 4, 6, 8, 10])
    end
    it "#take an array and add every element by 2" do
      expect(@list.map { |i| i + 2 }).to eq([3, 4, 5, 6, 7])
    end
  end

  context "test on my_inject alias for inject" do
    it "# return the sum of elements of array" do
      expect(@list.my_inject(0) { |i, v| i + v }).to eq(15)
    end
    it "# return the multiplication of elements of array" do
      expect(@list.my_inject(1) { |i, v| i * v }).to eq(120)
    end
  end

  context "test on special function" do
    it "# return the multiplication of elements of array" do
      expect(multiply_els(@list)).to eq(120)
    end
  end
end
