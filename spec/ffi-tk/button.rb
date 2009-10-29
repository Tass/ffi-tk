require_relative '../helper'

Tk.init

describe Tk::Button do
  it 'handles -command' do
    ran = false
    Tk.callbacks.size.should == 0

    button = Tk::Button.new('.'){
      ran = true
      button.destroy
    }
    button.invoke

    Tk.callbacks.size.should == 0
    ran.should == true
  end

  it 'sets the text of the button' do
    button = Tk::Button.new('.', text: 'Hello, World!')
    button.cget(:text).should == 'Hello, World!'
  end
end
