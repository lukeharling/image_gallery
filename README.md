# Image Gallery (Rails 8)

A simple image gallery application built with Ruby on Rails 8, PostgreSQL, Tailwind CSS, and Active Storage.  
Users will be able to create accounts, upload images, organise them into galleries, and browse them through a clean, responsive interface.

This project is being developed on Windows 11 using Ruby 3.4.9 and Rails 8.1.3.

---

## Tech Stack

- Ruby 3.4.9  
- Rails 8.1.3  
- PostgreSQL  
- TailwindCSS (via tailwindcss-rails)  
- Importmap, Turbo, Stimulus  
- MiniMagick (via image_processing)  
- Devise (planned)  
- Active Storage (planned)

---

## Setup Instructions

### 1. Clone the repository
```bash
git clone [<repo-url>](https://github.com/lukeharling/image_gallery)
cd image_gallery
```

### 2. Install dependencies
```bash
bundle install
```

### 3. Configure the database
Edit `config/database.yml` and set your PostgreSQL with username: postgres and password: postgres
Then create the databases:
```bash
rails db:create
```

### 4. Start the Rails server
```bash
rails server
```
Visit the link.

## Windows Notes

### VIPS Warnings
Rails may print warnings such as: unable to load vips-heif.dll unable to load vips-jxl.dll
These warnings are harmless.  
Windows does not ship optional VIPS modules.  
This project uses MiniMagick for image processing.

---

## Planned Features

- User authentication (Devise)  
- User profiles  
- Create galleries  
- Upload images to galleries  
- Image resizing and thumbnails  
- Public and private galleries  
- Responsive Tailwind UI  
- Pagination or infinite scroll  
- Search and filtering

---

## Development Notes

- Developed on Windows 11  
- PostgreSQL installed locally  
- VS Code used as the primary editor  
- Git and GitHub for version control  
- TailwindCSS for styling  
- MiniMagick for image variants

---

### Note on running in Production Mode (Windows Only)
I had problems running production mode on Windows using Rails 8's default asset pipeline (Propshaft) doesn't support production mode. I've been told by Copilot that this won't be a problem for Linux/MacOS users so hopfully it should be fine. The app does work fully in development mode (if production doesn't work) apart from the custom error pages which I haven't been able to test (but I believe should work).