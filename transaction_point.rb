class TransactionPoint
  def initialize(window, transaction, all_x_values)
    @transaction = transaction
    @size = [transaction.amount.to_i, 100].min
    @window = window
    @all_x_values = all_x_values
  end

  def x
    @all_x_values[@transaction.id] ||= rand(@window.width)
  end

  def y
    Time.now - @transaction.created_at
  end

  def draw
    color = Gosu::Color::RED
    @window.draw_quad(x,         y - @size/2,         color,
                      x + @size, y - @size/2,         color,
                      x,         y + @size/2, color,
                      x + @size, y + @size/2, color)
  end
end
