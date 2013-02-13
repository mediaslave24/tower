def load_if_exists(file)
  load file if File.exists?(file)
end

def aecard?
  ENV['RAILS_ENV'] == 'development' && ENV['PWD'] == '/home/michael/rails-projects/artistecard'
end

if aecard?
  load_if_exists("#{ENV['PWD']}/lib/irbrc")
end
