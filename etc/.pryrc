begin
  require 'hirb'
rescue LoadError
end

if defined? Hirb
  extend Hirb::Console
  def vtable(record, options = {}, *args)
    table record, { vertical: true }.merge(options), *args
  end
end
