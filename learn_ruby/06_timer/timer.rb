class Timer
  #write your code here
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def padded(t)
    t < 10 ? "0#{t}" : t.to_s
  end

  def time_string
    hours = @seconds / 3600
    minutes = (@seconds % 3600) / 60
    seconds = @seconds % 60
    "#{padded(hours)}:#{padded(minutes)}:#{padded(seconds)}"
  end
end
