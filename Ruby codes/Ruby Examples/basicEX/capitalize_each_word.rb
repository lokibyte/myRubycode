PARTICULES = [ "de", "di", "von", "van" ]

class String
  def name_capitalize
    if self.include?("-")
      l = self.split("-")
      lo = []
      l.each { |ll| lo << ll.capitalize }
      return lo.join("-")
    elsif self.include?(" ")
      l = self.split(" ")
      lo = []
      l.each { |ll|
        if PARTICULES.include? ll
          lo << ll
        else
          lo << ll.capitalize
        end
      }
      return lo.join(" ")
    else
      return self.capitalize
    end
  end
end
puts String.name_capitalize