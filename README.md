## Description

  The BBQ application is intended for users who likes creating events to share fun with everyone subscribed.
  Every event has its own map, based on Yandex.map service, with assigned point of collaboration, images gallery, which simple in use and subscription list.
  Authentication using email or via Vkontakte and Facebook are supported. Password repair implemented as well.
  Users can update own profile and events once created.

## Language and framework
  * Ruby 3.0.2
  * Rails 6.1.5

## How to use

  * Demo
  ```
  https://minibbq.herokuapp.com/
  ```
  * Download folder from repository or use clonning
  ```
  git clone git@github.com:Ignessio/bbq
  ```
  * Install required labraries
  ```
  bundle install
  ```
  * Manage Nodejs dependencies
  ```
  yarn
  ```
  * Create database and apply migrations
  ```
  rails db:create db:migrate
  ```
  * Add your own secrets to credentials.yml.enc file
  * Start rails server using
  ```
  bundle exec rails start
  ```
  * Open new window in preffered browser and enter page address
  ```
  http://localhost:3000/
  ```

## Authenticatioin settings

  In order to use full application functions authentication keys needs to be added in
  credentials.yml encrypted file.
  The following credentials required:

  ```
  yandex_cloud:
    access_key: <your_access_key>
    secret_key: <your_secret_key>
    bucket_name: <your_ bucket_name>

  mailjet:
    api_key: <your_api_key>
    secret_key: <your_secret_key>
    sender_email: <your_email>
    sender_host: <your_host>
  ```
