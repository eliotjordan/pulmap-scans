
# Set passwords for creating ARKs
unless Rails.env.production?
  ENV['EZID_DEFAULT_SHOULDER'] = 'ark:/99999/fk4'
  ENV['EZID_DEFAULT_RESOLVER'] = 'http://ezid.cdlib.org/id/ark:/99999/'
  ENV['EZID_TARGET_BASE'] = 'http://map.princeton.edu/mapviewer/#/'
end

if Rails.env.production?
  ENV['EZID_DEFAULT_SHOULDER'] = 'ark:/88435/'
  ENV['EZID_DEFAULT_RESOLVER'] = 'http://arks.princeton.edu/ark:/88435/'
  ENV['EZID_TARGET_BASE'] = 'http://map.princeton.edu/mapviewer/#/'
end
