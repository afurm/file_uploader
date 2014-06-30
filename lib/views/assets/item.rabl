object @asset

attributes :title, :id
node(:url) { |file| file.file.url }
node(:user) { |file| file.user.handler rescue 'N/A'}