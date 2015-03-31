class Repeat < Struct.new(:pattern)
  include Pattern

  def to_s
    pattern.bracket(precedence) + '*'
  end

  def precedence
    2
  end

  def to_nfa_design
    pattern_nfa_design = pattern.to_nfa_design

    start_state = Object.new
    accept_states = pattern_nfa_design.accept_states + [start_state]

    rules = pattern_nfa_design.rulebook.rules
    extra_rules = pattern_nfa_design.accept_states.map do |accept_state|
      FaRule.new(accept_state, nil, pattern_nfa_design.start_state)
    end + [FaRule.new(start_state, nil, pattern_nfa_design.start_state)]
    rulebook = NfaRulebook.new(rules + extra_rules)

    NfaDesign.new(start_state, accept_states, rulebook)
  end
end

