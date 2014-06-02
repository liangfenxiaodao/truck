class Goods
  attr_reader :weight, :volume

  def initialize(weight, volume)
    @weight = weight
    @volume = volume
  end
end