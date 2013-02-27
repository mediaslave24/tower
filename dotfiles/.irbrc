def irbrc
  load(File.expand_path(__FILE__))
end

unless Dir::pwd == File.expand_path('~')
  irbrc = File.expand_path('.irbrc')
  if File.exists?(irbrc)
    puts "Loading #{irbrc}"
    load irbrc 
  end
end
