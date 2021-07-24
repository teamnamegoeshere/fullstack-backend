# README

## Popcornbucketlist Backend

This repository contains the source code for the Rails backend of Popcorn Bucket List. The Frontend repository can be found at https://github.com/teamnamegoeshere/fullstack-frontend

### Getting Started
- Ensure you have [Ruby](https://www.ruby-lang.org/en/documentation/installation/) installed
- Ensure you have [Rails](https://rails.github.io/download/) installed
- Clone this repository with [Git](https://git-scm.com/downloads), or [download from GitHub](https://github.com/teamnamegoeshere/fullstack-backend/archive/refs/heads/main.zip) and unzip
- Open the directory in terminal:
  - Run ```bundle install``` in terminal to install dependencies
  - Create a development database with ```rails db:create```
  - Run database migrations with ```rails db:migrate```
  - Add dummy database records for testing with ```rails db:seed```
  - Run the development server locally: ```rails s -p 4000``` We recommend port 4000 when testing in conjunction with the frontend repository
- Open a web browser and navigate to ```localhost:4000```

### Functionality

This repository contains a ```client.http``` file in the root directory. This is designed for testing with the humao.rest-client VSCode extension. It also serves to document the API routes of this applications and their functions.
