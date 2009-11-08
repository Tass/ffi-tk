module Tk
  class Widget
    include Pack, Destroy, Bind, Bindtags, WM, Winfo, Grid, Clipboard, Place, TkCmd

    attr_reader :parent, :tk_pathname

    def initialize(parent = Tk.root, options = None)
      if parent.respond_to?(:to_tcl_options?)
        parent, options = Tk.root, parent
      end

      if !options || None == options
        options = {}
      else
        options = options.dup
      end

      @parent = parent

      command =
        if self.class.const_defined?(:INITIALIZE_COMMAND)
          self.class::INITIALIZE_COMMAND
        else
          self.class.name[/(\w+)$/].downcase
        end

      yield(options) if block_given? && !options[:command]

      Tk.execute(command, assign_pathname, options.to_tcl_options?)
    end

    def to_tcl
      tk_pathname.dump
    end

    def focus(option = None)
      Focus.focus(self, option)
    end

    def focus_next
      Focus.next(self)
    end

    def focus_prev
      Focus.prev(self)
    end

    def raise(above = None)
      Raise.raise(self, above)
    end

    def lower(below = None)
      Lower.lower(self, below)
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
