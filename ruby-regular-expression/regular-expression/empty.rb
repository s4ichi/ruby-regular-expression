class Empty
  include Pattern

  def to_s
    ''
  end

  def precedence
    3
  end

  def to_nfa_design
    start_state = Object.new
    accept_states = [start_state]
    rulecook = NfaRulebook.new([])

    NfaDesign.new(start_state, accept_states, rulecook)
  end
end

