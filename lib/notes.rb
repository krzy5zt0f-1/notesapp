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
end
