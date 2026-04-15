# Be sure to restart your server when you modify this file.

Rails.application.config.assets.version = "1.0"

# Register the Tailwind build directory
Rails.application.config.assets.paths << Rails.root.join("app/assets/tailwind")

# Tell Rails to use Tailwind as the CSS compressor
Rails.application.config.assets.css_compressor = :tailwindcss