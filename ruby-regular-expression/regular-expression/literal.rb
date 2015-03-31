class Literal < Struct.new(:character)
  include Pattern

  def to_s
    character
  end

  def precedence
    3
  end

  def to_nfa_design
    start_state = Object.new
    accept_states = Object.new
    rule = FaRule.new(start_state, character, accept_states)
    rulebook = NfaRulebook.new([rule])

    NfaDesign.new(start_state, [accept_states], rulebook)
  end
end
