require "quaternionic/version"
require "matrix"
require "complex"

module Quaternionic
  class Qua

    attr_accessor :a, :b, :c, :d
    attr_accessor :v
    #w,x,y,z, v

    ##
    # Initializer that returns an instance of Quaternionic.
    # The following code instantiates a Quaternion of form
    # a + b _i_ + c _j_ + d _k_, where a = 1, b = 2, c = 3 and d = 4.
    # Depending on given attributes - many possible kind or arguments are possible
    #   q = Qua.new(1.0, 2.0, 3.0, 4.0)         # => Qua(1.0; Vector[2.0, 3.0, 4.0])
    #   q = Qua.new(1.0, [2.0, 3.0, 4.0])       # => Qua(1.0; Vector[2.0, 3.0, 4.0])
    #   q = Qua.new(1.0, Vector[2.0, 3.0, 4.0]) # => Qua(1.0; Vector[2.0, 3.0, 4.0])
    #   q = Qua.new(Complex(1,2), Complex(3,4)) # => Qua(1.0; Vector[2.0, 3.0, 4.0])
    # TODO: 3x3 transform/rotation matrix form
    # TODO: Euler angels form (ra,dec,roll in degrees)

    def initialize(*args)
      args_size = args.size
      case args_size
        when 2
          first, second = args
          if first.kind_of? Numeric

            set_scalar(first)

            if second.kind_of? Array
              set_vector(second)
            elsif second.kind_of? Vector
              vector_to_ary = Vector.elements(second)
              set_vector(vector_to_ary)
            else
              raise ArgumentError, "Given wrong type"
            end

          end

          if first.kind_of? Complex and second.kind_of? Complex
            complex_init(first, second)
          end
        when 3
          raise "Implement me :( - Nor Matrix or Euler Angles available yet"
        when 4
          set_scalar(args.first)
          set_vector(args[1..3])
      end
    end

    def real
      @a
    end

    alias :re :real
    alias :real_part :real
    alias :scalar :real

    def imag
      Vector[@b, @c, @d]
    end

    alias :im :imag
    alias :imaginary :imag
    alias :imaginary_part :imag
    alias :vector :imag

    def ==(other)
      check_args(other) #TODO: DRY
      @a == other.a and @b == other.b and @c == other.c and @d == other.d
    end

    def +(other)
      check_args(other) #TODO: DRY
      return Qua.new(@a + other.a, @b + other.b, @c + other.c, @d + other.d) #FIXME: More math
    end

    def -(other)
      check_args(other) #TODO: DRY
      return Qua.new(@a - other.a, @b - other.b, @c - other.c, @d - other.d) #FIXME: More math
    end

    def *(other)

    end

    def /(other)

    end

    def conjugate(other)

    end

    #alias mult, conj, inv

    def inverse

    end

    def normalize

    end

    def normalize!

    end

    def to_s

    end

    def inspect

    end

    def rotate

    end

    def coerce

    end

    private

    def set_scalar(value)
      @a = value
    end

    def set_vector(vector)
      @v = vector.copy
      @b, @c, @d = @v
    end

    def to_vector

    end

    def to_scalar

    end

    def to_complex

    end

    def euler_init(ra, dec, roll)
      raise "Implement me"
    end

    def matrix_init(matrix)
      raise "Implement me"
    end

    def complex_init(z1, z2)
      raise "Argument Error" unless (z1.instance_of? Complex and z2.instance_of? Complex)

      set_scalar(z1.real)
      b, c, d = z1.imag, z2.real, z2.imag
      set_vector([b,c,d])
    end

    def check_args(other)
      raise ArgumentError, "Wrong type given to compare" unless other.is_a? self.class
    end

  end
end
