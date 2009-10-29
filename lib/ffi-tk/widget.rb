module Tk
  class Widget
    include Pack, Destroy, Bind

    attr_reader :parent, :tk_pathname

    def to_tcl
      tk_pathname.dump
    end

    private

    def assign_pathname
      @tk_pathname = Tk.register_object(parent, self)
    end

    def execute_only(command, *args)
      Tk.execute_only(tk_pathname, command, *args)
    end

    def execute(command, *args)
      Tk.execute(tk_pathname, command, *args)
    end

    def tcl_option(option)
      option = option.to_s
      option[0] == '-' ? option : "-#{option}"
    end
  end
end