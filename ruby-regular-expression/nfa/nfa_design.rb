class NfaDesign < Struct.new(:start_state, :accept_states, :rulebook)
  def accepts?(string)
    to_nfa.tap do |nfa|
      nfa.read_string(string)
    end.accepting?
  end

  def to_nfa
    Nfa.new(Set[start_state], accept_states, rulebook)
  end
end
