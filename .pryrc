require 'hirb'

# hirb
Hirb.enable
extend Hirb::Console
old_print = Pry.config.print
Pry.config.print = proc do |output, value|
  Hirb::View.view_or_page_output(value) || old_print.call(output, value)
end
