require "primes/generator"

class Array
  def pretty_print
    puts self.map { |x| x.join(" ") }

    #This way dont work for higher values of n
    #self.each do |row|
    #  puts "|#{row.map { |col| "#{" " * (Primes::Generator::MATRIX_GAP - col.to_s.length)}#{col}" }.join(" ")}|"
    #end
  end
end
