module ApplicationHelper
    def lightbox_images
        return [] unless defined?(@gallery) && @gallery.present?
        @gallery.photos.map { |p| url_for(p.image) }
    end
end
