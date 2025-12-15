# Taggin

Taggin is a Ruby on Rails application for managing music albums and songs. It helps you organize your personal music collection with advanced tagging capabilities, user authentication, and a separation between personal ("You") and public views.

## Features

*   **Album & Song Management**: specific namespace for managing your own collection.
*   **Public View**: Shareable views for albums and songs.
*   **Audio Metadata**: Uses `taglib` to extract and manage audio file metadata.
*   **User Authentication**: Secure signup and login functionality.
*   **Modern Frontend**: Built with Hotwire (Turbo & Stimulus), styled with Tailwind CSS and Flowbite, using Slim for templates.

## Prerequisites

Ensure you have the following installed on your system:

*   **Ruby**: 3.3.0 (defined in `.ruby-version`)
*   **Node.js**: (version compatible with current `package.json`)
*   **PostgreSQL**: Database server
*   **Redis**: For background jobs and caching
*   **TagLib**: System library for reading/editing audio meta-data.
    *   macOS: `brew install taglib`
    *   Debian/Ubuntu: `sudo apt-get install libtag1-dev`

## Setup

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd taggin
    ```

2.  **Install dependencies:**
    ```bash
    bundle install
    yarn install
    ```

3.  **Database Setup:**
    ```bash
    bin/rails db:create
    bin/rails db:migrate
    ```

## Usage

To start the development server along with the CSS and JS build watchers:

```bash
bin/dev
```

This will run:
*   Rails server (port 3000)
*   JS builder (esbuild)
*   CSS builder (Tailwind)

Visit `http://localhost:3000` to see the app.

## Testing

This project uses **RSpec** for testing.

To run the test suite:

```bash
bundle exec rspec
```

## Linting

Code style is enforced using **RuboCop**.

To run the linter:

```bash
bundle exec rubocop
```

## Tech Stack

*   **Framework**: Ruby on Rails 7.2.1
*   **Language**: Ruby 3.3.0
*   **Database**: PostgreSQL
*   **Frontend**:
    *   **Templating**: Slim
    *   **CSS**: Tailwind CSS, Flowbite
    *   **JS**: Stimulus, Turbo, Esbuild
*   **Infrastructure/Services**:
    *   Redis (via Kredis) for temporary data/caching
    *   ActiveStorage with `image_processing` for handling uploads
    *   `taglib-ruby` for audio file manipulation
