module Tk
  module Cget
    def cget(option)
      option = tcl_option(option)
      option_to_ruby(option, execute('cget', option))
    end

    private

    INTEGER  = %w[
                  -height
                  -width
                  -maxundo
                  -spacing1
                  -spacing2
                  -spacing3
                  -borderwidth
                  -bd
                  -highlightthickness
                  -insertborderwidth
                  -insertofftime
                  -insertontime
                  -insertwidth
                  -padx
                  -pady
                  -selectborderwidth
                  -endline
                  -startline
                 ]
    SYMBOL   = %w[
                  -wrap
                  -state
                  -tabstyle
                  -relief
                  -justify
                  -validate
                 ]
    BOOLEAN  = %w[
                  -autoseparators
                  -blockcursor
                  -undo
                  -exportselection
                  -setgrid
                  -takefocus
                 ]
    COLOR    = %w[
                  -inactiveselectbackground
                  -disabledbackground
                  -disabledforeground
                  -background
                  -bg
                  -foreground
                  -fg
                  -highlightbackground
                  -highlightcolor
                  -insertbackground
                  -selectbackground
                  -selectforeground
                  -readonlybackground
                 ]
    STRING   = %w[-tabs -cursor -text -show]
    FONT     = %w[-font]
    COMMAND  = %w[
                  -invalidcommand
                  -invcmd
                  -yscrollcommand
                  -xscrollcommand
                  -validatecommand
                  -vcmd
                  ]
    VARIABLE = %w[-textvariable]

    def option_to_ruby(name, value)
      case tcl_option(name)
      when *INTEGER
        value.to_i
      when *SYMBOL
        value.to_sym
      when *BOOLEAN
        value == 1
      when *COLOR
        value.to_s
      when *STRING
        value.to_s
      when *FONT
        value.to_s
      when *COMMAND
        string = value.to_s
        string unless string.empty?
      when *VARIABLE
        value.to_s
      else
        raise "Unknown option: %p: %p" % [name, value]
      end
    end
  end
end