class Choose < Struct.new(:first, :second)
  include Pattern

  def to_s
    [first, second].map do |pattern|
      pattern.bracket(precedence)
    end.join('|')
  end

  def precedence
    0
  end
end

