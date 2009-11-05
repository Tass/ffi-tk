module Tk
  module TkCmd

    # @see TkCmd.appname
    def tk_appname(?newName?)
      TkCmd.appname(self, ?newName?)
    end

    # @see TkCmd.caret
    def tk_caret(?-x x? ?-y y? ?-height height?)
      TkCmd.caret(self, ?-x x? ?-y y? ?-height height?)
    end

    # @see TkCmd.scaling
    def tk_scaling(?-displayof window? ?number?)
      TkCmd.scaling(self, ?-displayof window? ?number?)
    end

    # @see TkCmd.inactive
    def tk_inactive(?-displayof window? ?reset?)
      TkCmd.inactive(self, ?-displayof window? ?reset?)
    end

    # @see TkCmd.useinputmethods
    def tk_useinputmethods(?-displayof window? ?boolean?)
      TkCmd.useinputmethods(self, ?-displayof window? ?boolean?)
    end

    module_function

    # If newName is not specified, this command returns the name of the
    # application (the name that may be used in send commands to communicate
    # with the application).
    # If newName is specified, then the name of the application is changed to
    # newName. If the given name is already in use, then a suffix of the form “
    # #2” or “ #3” is appended in order to make the name unique.
    # The command's result is the name actually chosen.
    # newName should not start with a capital letter.
    # This will interfere with option processing, since names starting with
    # capitals are assumed to be classes; as a result, Tk may not be able to
    # find some options for the application.
    # If sends have been disabled by deleting the send command, this command
    # will reenable them and recreate the send com‐ mand.
    def appname(?newName?)
      Tk.execute(:tk, :appname, ?newName?)
    end

    # Sets and queries the caret location for the display of the specified Tk
    # window window.
    # The caret is the per-display cursor location used for indicating global
    # focus (e.g.
    # to comply with Microsoft Accessibility guidelines), as well as for
    # location of the over-the-spot XIM (X Input Methods) or Windows IME
    # windows. If no options are specified, the last values used for setting
    # the caret are return in option-value pair format.
    # -x and -y represent window-relative coordinates, and -height is the
    # height of the current cursor location, or the height of the specified
    # window if none is given.
    def caret(window ?-x x? ?-y y? ?-height height?)
      Tk.execute(:tk, :caret, window ?-x x? ?-y y? ?-height height?)
    end

    # Sets and queries the current scaling factor used by Tk to convert between
    # physical units (for example, points, inches, or millimeters) and pixels.
    # The number argument is a floating point num‐ ber that specifies the
    # number of pixels per point on window's display.
    # If the window argument is omitted, it defaults to the main window.
    # If the number argument is omitted, the current value of the scaling
    # factor is returned.
    # A “point” is a unit of measurement equal to 1/72 inch.
    # A scaling factor of 1.0 corresponds to 1 pixel per point, which is
    # equivalent to a standard 72 dpi monitor.
    # A scaling factor of 1.25 would mean 1.25 pixels per point, which is the
    # setting for a 90 dpi monitor; setting the scaling factor to 1.25 on a 72
    # dpi monitor would cause everything in the application to be displayed
    # 1.25 times as large as normal.
    # The initial value for the scaling factor is set when the application
    # starts, based on properties of the installed monitor, but it can be
    # changed at any time.
    # Measurements made after the scaling factor is changed will use the new
    # scaling factor, but it is undefined whether existing widgets will resize
    # themselves dynamically to accommodate the new scaling factor.
    def scaling(?-displayof window? ?number?)
      Tk.execute(:tk, :scaling, ?-displayof window? ?number?)
    end

    # Returns a positive integer, the number of milliseconds since the last
    # time the user interacted with the system.
    # If the -displayof option is given then the return value refers to the
    # display of window; otherwise it refers to the display of the
    # application's main window.
    # tk inactive will return -1, if querying the user inactive time is not
    # supported by the system, and in safe interpreters.
    # If the literal string reset is given as an additional argument, the timer
    # is reset and an empty string is returned.
    # Resetting the inactivity time is forbidden in safe interpreters and will
    # throw and error if tried.
    def inactive(?-displayof window? ?reset?)
      Tk.execute(:tk, :inactive, ?-displayof window? ?reset?)
    end

    # Sets and queries the state of whether Tk should use XIM (X Input Methods)
    # for filtering events.
    # The resulting state is returned.
    # XIM is used in some locales (i.e., Japanese, Korean), to han‐ dle special
    # input devices.
    # This feature is only significant on X.
    # If XIM support is not available, this will always return 0.
    # If the window argument is omitted, it defaults to the main win‐ dow.
    # If the boolean argument is omitted, the current state is returned.
    # This is turned on by default for the main display.
    def useinputmethods(?-displayof window? ?boolean?)
      Tk.execute(:tk, :useinputmethods, ?-displayof window? ?boolean?)
    end
  end
end
