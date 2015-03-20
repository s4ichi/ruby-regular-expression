class NfaRulebook < Struct.new(:rules)
  def next_states(states, character)
    states.flat_map do |state|
      follow_rules_for(state, character)
    end.to_set
  end

  def follow_rules_for(state, character)
    rules_for(state, character).map(&:follow)
  end

  def rules_for(state, character)
    rules.select do |rule|
      rule.applies_to?(state, character)
    end
  end
end

