module Tk
  class MenuButton < Button
    include Cget, Configure

    def self.tk_command; 'menubutton'; end
  end
end
