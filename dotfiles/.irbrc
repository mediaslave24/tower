def load_if_exist(file)
    load(file) if File.exist?(file)
end

def aecard?
    ENV['PWD'] == '/home/michael/Work/rails-projects/artistecard' && ENV['RAILS_ENV'] == 'development'
end

if aecard?
    load_if_exist("#{ENV['PWD']}/lib/irbrc")
end
