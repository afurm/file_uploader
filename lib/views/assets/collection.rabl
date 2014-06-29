collection @assets

attributes :title, :id
child(:file) { |file| file.file.url rescue 'N/A' }