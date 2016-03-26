# /------------------------------------------\
# |            Brainfuck Objects             |
# \------------------------------------------/

class Sequence
  attr_accessor :list
# ============================================
# |          Object Initialization           |
# ============================================
  def initialize(actions)
    @list = segment(actions)
  end

# ============================================
# |            Data Segmentation             |
# ============================================
  def segment(acts)
    actions = []
    acts.each_with_index do |c, i|
      buff = c
      case buff
      when '+'; actions += [:add]
      when '-'; actions += [:sub]
      when '<'; actions += [:left]
      when '>'; actions += [:right]
      when '['
        i.times { |n| acts.delete_at(n) }
        actions += [Loop.new(acts)]
      when ']'
        return actions
      end
    end
    actions
  end
end

class Loop < Sequence
end

class Memory
  def initialize
    @index = 0
    @memory = Array.new(256, 0)
  end
end

input = "+++++[>+++<[-[+-]+-]>++++]+++++[>+++<-]+++."
list = input.split(//)

sequence = Sequence.new(list)
sequence.list.each do |s|
  if s.is_a?(Loop)
    puts s.list
  else
    puts s
  end
end
