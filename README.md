# Image Gallery (Rails 8)

A simple image gallery application built with Ruby on Rails 8, PostgreSQL, Tailwind CSS, and Active Storage.
Users can register, create galleries, upload photos, and browse public galleries through a clean, responsive interface.
Developed on Windows 11 using Ruby 3.4.9 and Rails 8.1.3.

---

## Features

### Mandatory Requirements

- User registration and login
- Only authenticated users can create galleries and upload photos
- Users can add, edit, and delete their own galleries
- Users can add, edit, and delete their own photos
- Public galleries viewable by anyone
- Thumbnail images precomputed using Active Storage variants
- Clicking a thumbnail opens the full‑size image
- Clean, maintainable Rails 8 codebase

### Desirable Enhancements

- Automatic slideshow mode inside the lightbox
- Custom 404 and 500 error pages
- Basic system tests demonstrating best practices
- Responsive Tailwind UI

---

## Tech Stack

- Ruby 3.4.9
- Rails 8.1.3
- PostgreSQL
- TailwindCSS (via tailwindcss-rails)
- Turbo & Stimulus (Hotwire)
- Active Storage + MiniMagick for image processing
- Custom authentification system (email + password)

---

## Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/lukeharling/image_gallery
cd image_gallery
```

### 2. Install dependencies
```bash
bundle install
```

### 3. Configure the database
Edit `config/database.yml` if needed.
Default local setup expects:
- username: `postgres`
- password: `postgres`
Then create the database:
```bash
rails db:create
rails db:migrate
```

### 4. Start the Rails server
```bash
rails server
```
Visit:
```
http://localhost:3000
```

---

## Running Tests

This project includes a small set of system tests.
Run them with:
```bash
rails test:system
```

---

## Windows Notes

### VIPS Warnings
Rails may print warnings such as:
```
unable to load vips-heif.dll
unable to load vips-jxl.dll
```
These are harmless.
Windows does not ship optional VIPS modules.
Image processing in this project uses MiniMagick, not libvips.

---

### Note on running in Production Mode (Windows Only)
Rails 8 uses Propshaft as its default asset pipeline.
Propshaft does not fully support production mode on Windows, which may cause missing CSS/JS when running:
```
RAILS_ENV=production rails s
```
This issue affects Windows only.
Custom error pages only work in real production environments, though Windows cannot preview them due to this, however the application runs correctly in development mode on all platforms.