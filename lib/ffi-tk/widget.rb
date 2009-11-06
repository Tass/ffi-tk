module Tk
  class Widget
    include Pack, Destroy, Bind, Focus, WM, Winfo

    attr_reader :parent, :tk_pathname

    def initialize(parent = Tk.root, options = None)
      if parent.respond_to?(:to_tcl_options?)
        parent, options = Tk.root, parent
      end

      @parent = parent

      command =
        if self.class.const_defined?(:INITIALIZE_COMMAND)
          self.class::INITIALIZE_COMMAND
        else
          self.class.name.downcase
        end

      Tk.execute(command, assign_pathname, options.to_tcl_options?)
    end

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
  end
end