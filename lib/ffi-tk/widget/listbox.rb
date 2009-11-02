module Tk
  class Listbox
    def initialize(parent, options = {})
      @parent = parent
      Tk.execute('listbox', assign_pathname, options.to_tcl_options)
    end


    def option(?arg arg ...?)
      execute(:option, ?arg arg ...?)
    end

    # Sets the active element to the one indicated by index.
    # If index is outside the range of elements in the listbox then the closest
    # element is activated.
    # The active element is drawn as speci‐ fied by -activestyle when the
    # widget has the input focus, and its index may be retrieved with the index
    # active.
    def activate(index)
      execute(:activate, index)
    end

    # Returns a list of four numbers describing the bounding box of the text in
    # the element given by index.
    # The first two elements of the list give the x and y coordinates of the
    # upper-left corner of the screen area covered by the text (specified in
    # pixels relative to the widget) and the last two elements give the width
    # and height of the area, in pixels.
    # If no part of the element given by index is visible on the screen, or if
    # index refers to a non-existent element, then the result is an empty
    # string; if the element is partially visible, the result gives the full
    # area of the element, including any parts that are not visible.
    def bbox(index)
      execute(:bbox, index)
    end

    # Returns the current value of the configuration option given by option.
    # Option may have any of the values accepted by the listbox command.
    def cget(option)
      execute(:cget, option)
    end

    # Query or modify the configuration options of the widget.
    # If no option is specified, returns a list describing all of the available
    # options for pathName (see Tk_ConfigureInfo for information on the format
    # of this list).
    # If option is specified with no value, then the command returns a list
    # describing the one named option (this list will be identical to the
    # corresponding sublist of the value returned if no option is specified).
    # If one or more option-value pairs are specified, then the command
    # modifies the given widget option(s) to have the given value(s); in this
    # case the command returns an empty string.
    # Option may have any of the values accepted by the listbox command.
    def configure(?option? ?value option value ...?)
      execute(:configure, ?option? ?value option value ...?)
    end

    # Returns a list containing the numerical indices of all of the elements in
    # the listbox that are currently selected.
    # If there are no elements selected in the listbox then an empty string is
    # returned.
    def curselection
      execute(:curselection)
    end

    # Deletes one or more elements of the listbox.
    # First and last are indices specifying the first and last elements in the
    # range to delete.
    # If last is not specified it defaults to first, i.e.
    # a single element is deleted.
    def delete(first ?last?)
      execute(:delete, first ?last?)
    end

    # If last is omitted, returns the contents of the listbox element indicated
    # by first, or an empty string if first refers to a non-existent element.
    # If last is specified, the command returns a list whose elements are all
    # of the listbox elements between first and last, inclusive.
    # Both first and last may have any of the standard forms for indices.
    def get(first ?last?)
      execute(:get, first ?last?)
    end

    # Returns the integer index value that corresponds to index.
    # If index is end the return value is a count of the number of elements in
    # the listbox (not the index of the last element).
    def index(index)
      execute(:index, index)
    end

    # Inserts zero or more new elements in the list just before the element
    # given by index.
    # If index is specified as end then the new elements are added to the end
    # of the list.
    # Returns an empty string.
    def insert(index ?element element ...?)
      execute(:insert, index ?element element ...?)
    end

    # Returns the current value of the item configuration option given by
    # option. Option may have any of the values accepted by the listbox
    # itemconfigure command.
    def itemcget(index option)
      execute(:itemcget, index option)
    end

    # Query or modify the configuration options of an item in the listbox.
    # If no option is specified, returns a list describing all of the available
    # options for the item (see Tk_ConfigureInfo for information on the format
    # of this list).
    # If option is specified with no value, then the command returns a list
    # describing the one named option (this list will be identical to the
    # correspond‐ ing sublist of the value returned if no option is specified).
    # If one or more option-value pairs are specified, then the command
    # modifies the given widget option(s) to have the given value(s); in this
    # case the command returns an empty string.
    # The following options are currently supported for items: -background
    # color Color specifies the background color to use when displaying the
    # item. It may have any of the forms accepted by Tk_GetColor.
    # -foreground color Color specifies the foreground color to use when
    # displaying the item.
    # It may have any of the forms accepted by Tk_GetColor.
    # -selectbackground color color specifies the background color to use when
    # displaying the item while it is selected.
    # It may have any of the forms accepted by Tk_GetColor.
    # -selectforeground color color specifies the foreground color to use when
    # displaying the item while it is selected.
    # It may have any of the forms accepted by Tk_GetColor.
    def itemconfigure(index ?option? ?value? ?option value ...?)
      execute(:itemconfigure, index ?option? ?value? ?option value ...?)
    end

    # Given a y-coordinate within the listbox window, this command returns the
    # index of the (visible) listbox element nearest to that y-coordinate.
    def nearest(y)
      execute(:nearest, y)
    end

    # This command is used to implement scanning on listboxes.
    # It has two forms, depending on option:
    def scan(option args)
      execute(:scan, option args)
    end

    # Records x and y and the current view in the listbox window; used in
    # conjunction with later scan dragto commands.
    # Typically this command is associated with a mouse button press in the
    # widget. It returns an empty string.
    def scan(mark x y)
      execute(:scan, mark x y)
    end

    # This command computes the difference between its x and y arguments and
    # the x and y arguments to the last scan mark command for the widget.
    # It then adjusts the view by 10 times the dif‐ ference in coordinates.
    # This command is typically associated with mouse motion events in the
    # widget, to produce the effect of dragging the list at high speed through
    # the window.
    # The return value is an empty string.
    def scan(dragto x y.)
      execute(:scan, dragto x y.)
    end

    # Adjust the view in the listbox so that the element given by index is
    # visible. If the element is already visible then the command has no
    # effect; if the element is near one edge of the window then the listbox
    # scrolls to bring the element into view at the edge; otherwise the listbox
    # scrolls to center the element.
    def see(index)
      execute(:see, index)
    end

    # This command is used to adjust the selection within a listbox.
    # It has several forms, depending on option:
    def selection(option arg)
      execute(:selection, option arg)
    end

    # Sets the selection anchor to the element given by index.
    # If index refers to a non-existent element, then the closest element is
    # used. The selection anchor is the end of the selection that is fixed
    # while dragging out a selection with the mouse.
    # The index anchor may be used to refer to the anchor element.
    def selection(anchor index)
      execute(:selection, anchor index)
    end

    # If any of the elements between first and last (inclusive) are selected,
    # they are deselected.
    # The selection state is not changed for elements outside this range.
    def selection(clear first ?last?)
      execute(:selection, clear first ?last?)
    end

    # Returns 1 if the element indicated by index is currently selected, 0 if
    # it is not.
    def selection(includes index)
      execute(:selection, includes index)
    end

    # Selects all of the elements in the range between first and last,
    # inclusive, without affecting the selection state of elements outside that
    # range.
    def selection(set first ?last?)
      execute(:selection, set first ?last?)
    end

    # Returns a decimal string indicating the total number of elements in the
    # listbox.
    def size
      execute(:size)
    end

    # This command is used to query and change the horizontal position of the
    # information in the widget's window.
    # It can take any of the following forms:
    def xview(args)
      execute(:xview, args)
    end

    # Returns a list containing two elements.
    # Each element is a real fraction between 0 and 1; together they describe
    # the horizontal span that is visible in the window.
    # For example, if the first element is .2 and the second element is .6, 20%
    # of the listbox's text is off-screen to the left, the middle 40% is
    # visible in the window, and 40% of the text is off-screen to the right.
    # These are the same values passed to scrollbars via the -xscrollcommand
    # option.
    def xview
      execute(:xview)
    end

    # Adjusts the view in the window so that the character position given by
    # index is displayed at the left edge of the window.
    # Character positions are defined by the width of the character 0.
    def xview(index)
      execute(:xview, index)
    end

    # Adjusts the view in the window so that fraction of the total width of the
    # listbox text is off-screen to the left.
    # fraction must be a fraction between 0 and 1.
    def xview(moveto fraction)
      execute(:xview, moveto fraction)
    end

    # This command shifts the view in the window left or right according to
    # number and what.
    # Number must be an integer.
    # What must be either units or pages or an abbreviation of one of these.
    # If what is units, the view adjusts left or right by number character
    # units (the width of the 0 character) on the display; if it is pages then
    # the view adjusts by number screen‐ fuls.
    # If number is negative then characters farther to the left become visible;
    # if it is positive then characters farther to the right become visible.
    def xview(scroll number what)
      execute(:xview, scroll number what)
    end

    # This command is used to query and change the vertical position of the
    # text in the widget's window.
    # It can take any of the following forms:
    def yview(?args?)
      execute(:yview, ?args?)
    end

    # Returns a list containing two elements, both of which are real fractions
    # between 0 and 1.
    # The first element gives the position of the listbox element at the top of
    # the window, relative to the listbox as a whole (0.5 means it is halfway
    # through the listbox, for example).
    # The second element gives the position of the listbox element just after
    # the last one in the win‐ dow, relative to the listbox as a whole.
    # These are the same values passed to scrollbars via the -yscrollcommand
    # option.
    def yview
      execute(:yview)
    end

    # Adjusts the view in the window so that the element given by index is
    # displayed at the top of the window.
    def yview(index)
      execute(:yview, index)
    end

    # Adjusts the view in the window so that the element given by fraction
    # appears at the top of the window.
    # Fraction is a fraction between 0 and 1; 0 indicates the first element in
    # the listbox, 0.33 indicates the element one-third the way through the
    # listbox, and so on.
    def yview(moveto fraction)
      execute(:yview, moveto fraction)
    end

    # This command adjusts the view in the window up or down according to
    # number and what.
    # Number must be an integer.
    # What must be either units or pages.
    # If what is units, the view adjusts up or down by number lines; if it is
    # pages then the view adjusts by number screenfuls.
    # If number is negative then earlier elements become visible; if it is
    # positive then later ele‐ ments become visible.
    def yview(scroll number what)
      execute(:yview, scroll number what)
    end
  end
end
