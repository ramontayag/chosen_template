Dir.glob(File.join(SPEC_DIR, 'models', '**', '*.rb')).each do |f|
  require f
end
