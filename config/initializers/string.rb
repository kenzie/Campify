class String  
  # adds tabs to the beginning of each line
  def indent(tabs=4)
    self.gsub(/^/, "\t"*tabs)
  end
end