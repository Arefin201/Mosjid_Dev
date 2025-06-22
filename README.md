Mosque Management System - Al-Noor Mosque
https://public/images/mosque-dashboard.png

Overview
The Mosque Management System is a comprehensive web application designed to streamline mosque operations, enhance community engagement, and facilitate administrative tasks for Islamic centers. This Laravel-based solution provides features for prayer time management, donation tracking, event announcements, gallery management, and more.

Live Demo
View Live Demo
Admin Demo Credentials:
Email: admin@mosjid.com
Password: password

Features
Core Functionality
🕌 Mosque Information Management

🕋 Prayer Time Scheduling with automatic calculations

🤲 Donation Management with tracking and reporting

📅 Event & Announcement System

📸 Gallery Management for community photos

👥 Leadership Team Directory

Community Engagement
💳 Online Donation System with multiple payment methods

📱 Responsive Design for all devices

📢 Announcement Ticker for important updates

📬 Contact Form with message management

Administrative Tools
👤 User & Role Management

📊 Financial Reporting with visual charts

📋 Content Management System

🔐 Secure Authentication System

Technology Stack
Backend
PHP 8.1+

Laravel 10

MySQL Database

Frontend
Tailwind CSS

Alpine.js

Chart.js for data visualization

Development Tools
Docker for containerization

Composer for dependency management

Git for version control

Installation
Prerequisites
PHP 8.1+

Composer

Node.js 16+

MySQL 5.7+

Setup Instructions
Clone the repository:

bash
git clone https://github.com/Arefin201/Mosjid_Dev.git
cd Mosjid_Dev
Install dependencies:

bash
composer install
npm install
Configure environment:

bash
cp .env.example .env
php artisan key:generate
Configure database settings in .env:

env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=mosjid_dev
DB_USERNAME=root
DB_PASSWORD=
Run migrations and seeders:

bash
php artisan migrate --seed
Build assets:

bash
npm run build
Start development server:

bash
php artisan serve
Access the application:

text
http://localhost:8000
Project Structure
text
Mosjid_Dev/
├── app/                  # Application core
│   ├── Http/             # Controllers and middleware
│   ├── Models/           # Database models
│   └── Providers/        # Service providers
├── config/               # Configuration files
├── database/             # Database migrations and seeders
├── public/               # Publicly accessible assets
├── resources/            # Views, language files, and assets
│   ├── js/               # JavaScript files
│   ├── lang/             # Language files
│   └── views/            # Blade templates
├── routes/               # Application routes
├── storage/              # Storage for logs, cache, etc.
└── tests/                # Automated tests
Contributing
We welcome contributions! Please follow these steps:

Fork the repository

Create your feature branch (git checkout -b feature/amazing-feature)

Commit your changes (git commit -m 'Add some amazing feature')

Push to the branch (git push origin feature/amazing-feature)

Open a pull request

License
This project is licensed under the MIT License - see the LICENSE file for details.

Screenshots
Home Page
https://public/images/home-page.png

Prayer Times
https://public/images/prayer-times.png

Donation Dashboard
https://public/images/donation-dashboard.png

Admin Panel
https://public/images/admin-panel.png

Support
For support or questions, please open an issue on GitHub or contact support@mosjid-dev.com.

