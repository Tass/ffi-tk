module FFI
  module Tcl
    class EvalResult < ::Struct.new(:interp, :obj)
      TYPES = {}

      def self.reset_types(interp)
        TYPES.clear
        list = Tcl.new_list_obj(0, nil)
        Tcl.append_all_obj_types(interp, list)
        types_names = Tcl.list_map_string(interp, list)

        types_names.each do |name|
          type = Tcl.get_obj_type(name)
          TYPES[type.to_i] = name.to_sym
        end
      end

      def self.guess(interp, obj)
        unless obj.respond_to?(:type)
          obj = Obj.new(obj)
        end

        case type = TYPES[obj.type.to_i]
        when :list
          to_list(interp, obj)
        when :string, :pixel, :cmdName
          to_string(interp, obj)
        when :int
          to_int(interp, obj)
        else
          raise "Unknown type: %p" % [type] if type
          new(interp, obj)
        end
      end

      def self.to_list(interp, obj)
        result_pointer = MemoryPointer.new(:pointer)
        count_pointer  = MemoryPointer.new(:int)
        length_pointer = MemoryPointer.new(:int)

        Tcl.list_obj_length(interp, obj, count_pointer)
        count = count_pointer.get_int(0)

        (0...count).map do |idx|
          Tcl.list_obj_index(interp, obj, idx, result_pointer)
          element_pointer = result_pointer.get_pointer(0)
          value = guess(interp, element_pointer)
          block_given? ? yield(value) : value
        end
      end

      def self.to_boolean(interp, obj)
        boolean_pointer = MemoryPointer.new(:int)
        Tcl.get_boolean_from_obj(interp, obj, boolean_pointer)
        boolean_pointer.get_int(0) == 1
      end

      def self.to_int(interp, obj)
        int_pointer = MemoryPointer.new(:int)
        Tcl.get_int_from_obj(interp, obj, int_pointer)
        int_pointer.get_int(0)
      end

      def self.to_string(interp, obj)
        length_pointer = MemoryPointer.new(:int)
        Tcl.get_string_from_obj(obj, length_pointer)
      end

      def to_a
        self.class.to_list(interp, obj)
      end

      def to_sym
        string = self.class.to_string(interp, obj)
        string.empty? ? nil : string.to_sym
      end

      def to_i
        self.class.to_int(interp, obj)
      end

      def to_s
        self.class.to_string(interp, obj)
      end

      def to_bool
        self.class.to_boolean(interp, obj)
      end
    end
  end
end