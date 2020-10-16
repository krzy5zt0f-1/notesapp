class Notes

  def initialize
    @notes = []
  end

  def add(title, body)
    @notes << {title: title, body: body}
  end

  def see_list
    @notes.each { |note| puts "#{@notes.index(note) + 1}. " + note[:title] }

  end

  def select(n)
    fail "no such note exist" if (n - 1) < 0 || n > @notes.size
    @notes[n -1]
  end
end
