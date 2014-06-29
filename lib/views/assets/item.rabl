object @asset

attributes :title, :id
node(:url) { |file| file.file.url }