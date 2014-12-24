
module RecSym

  def self.this(thing)
    s = Symbolizer.new
    s.symbolized(thing)
  end

  class Symbolizer

    attr_reader :known

    def initialize
      @known = {}
    end

    def symbolized(thing)
      k = thing.object_id
      return known[k] if known.key? k

      if thing.is_a? Hash
        retval = {}
        known[k] = retval

        thing.each do |k, v|
          key   = (k.respond_to? :to_sym) ? k.to_sym : k
          value = symbolized(v)
          retval[key] = value
        end

      elsif thing.is_a? Array
        retval = []
        known[k] = retval

        thing.each do |x|
          retval.push symbolized(x)
        end

      else
        known[k] = thing
      end

      known[k]
    end
  end
end