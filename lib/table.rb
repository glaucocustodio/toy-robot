module Table
  class << self
    def x_min
      0
    end

    def x_max
      4
    end

    def y_min
      0
    end

    def y_max
      4
    end

    def valid?(x, y)
      valid_x?(x) && valid_y?(y)
    end

    def valid_for?(axis, coordinate)
      if axis == :x
        valid_x?(coordinate)
      elsif axis == :y
        valid_y?(coordinate)
      end
    end

    def valid_x?(coordinate)
      (x_min..x_max).cover?(coordinate.to_i)
    end

    def valid_y?(coordinate)
      (y_min..y_max).cover?(coordinate.to_i)
    end
  end
end
