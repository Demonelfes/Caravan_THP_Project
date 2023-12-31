<div align='center'>

# CaraVan

[![THP Badge](https://i.ibb.co/4Mqx3kg/thp-logo.jpg)](https://www.thehackingproject.org/)
[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/uses-js.svg)](https://forthebadge.com)
[![Ruby On Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)](https://rubyonrails.org/)
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

CaraVan is a final project made during the eleventh and twelfth week of *The Hacking Project* bootcamp.

[Pitch of the project](#pitch-of-the-project) |
[Live Site & Screenshots](#live-site--screenshots) |
[Gems & APIs](#gems--apis) |
[Features](#features) |
[Team](#team) |
[Acknowledgements](#acknowledgements) |
[The Hacking Project](#the-hacking-project) |
[Getting Started](#getting-started) 

</div>

## Pitch of the project

CaraVan is French web application offering a simple and convenient van rental platform designed to enhance your journey.


Option #1
Rent a CaraVan

Discover our fleet of professionally equipped campervans. We provide a selection of modern, safe, and comfortable vans to make your travel experience unforgettable. Whether you're a couple, a family, or a group of friends, our vans are suitable for all types of travelers. Enjoy practical features such as a fully equipped kitchen, comfortable beds, and clever storage space. Book now for your next adventure with CaraVan!

Option #2
Peer-to-Peer Rental

At CaraVan, we believe in community and sharing. We also offer owners of campervans the opportunity to list their vehicles for rent on our platform. If you own a campervan and would like to share it with other travel enthusiasts, you can offer it for rent on our website. It's an ideal way to monetize your campervan when you're not using it while allowing others to experience unique adventures.

Whether you choose to rent a campervan from our fleet or list your own for rent, CaraVan supports you throughout the booking process. We are committed to providing quality customer service, flexible rental options, and top-class campervans.

Plan your next van getaway with CaraVan and embark on limitless adventures!

## Live Site & Screenshots

[Live Site URL](https://caravan-5593e9ea452a.herokuapp.com/)

## Gems & APIs
- [Devise](https://github.com/heartcombo/devise)
- [Stripe](https://stripe.com/)
- [Mailjet](https://www.mailjet.com)
- [Geocoder](https://github.com/alexreisner/geocoder)
- [Mapkick](https://github.com/ankane/mapkick)
- [Mapbox](https://www.mapbox.com/)
- [Friendly_id](https://github.com/norman/friendly_id)
- [Google-cloud-storage](https://cloud.google.com)

## Features

- [x] As a guest, I can go on a van's page
- [x] As a guest, I can search through vans by tags, attribute, availability and/or location
- [x] As a guest, I can see the available vans on a map
- [x] As a guest, I can signup and login
- [x] As a guest, I can receive a mail to notify me that the signup process was successful
- [x] As an authenticated user, I can do what guests can do
- [x] As an authenticated user, I can select a van and check its available dates
- [x] As an authenticated user, I can rent a van according to its availability
- [x] As an authenticated user who wants to rent a van, I can receive a mail to notify me that my rental was successfuly registered.
- [x] As an authenticated user, I have a profile page where I can see my previous rentals
- [x] As an authenticated user, I can't see the profile of other users
- [x] As an authenticated user, I can't see the administrator dashboard
- [x] As an authenticated user, I can modify my profile
- [x] As an authenticated user, I can rent a van several times on diferent dates
- [x] As an authenticated user, I can offer my van for rent and upload details about my van, including tags
- [x] As an authenticated user who owns a van, I can receive a mail to notify me that my van was rented
- [x] As an admin, I can receive a mail to notify me that a private van was rented
- [x] As an admin, I can receive a mail to notify me that a company van was rented
- [x] As an admin, I can create, modify or hide a van
- [x] As an admin, I have access to a dashboard that recapitulates the vans owned by users
- [x] As an admin, I have access to a dashboard that recapitulates the orders that have been made
- [x] As an admin, I have access to a dashboard that recapitulates the vans owned by the company
- [x] As an admin, I have access to a dashboard that recapitulates the users list
- [x] As any user, URL are smarts

## Team

Our little team is composed of

| Name |GitHub|
| ---- | ---- |
| Laurie BOUSQUET |  [@Laurie2023](@Laurie2023) |
| Adrien CRESSON| [@Acresson](@Acresson) |
| Solène JABAUD | [@Sojabio](@Sojabio)|
| Alexis LOPEZ | [@Demonelfes](@Demonelfes) |
| Antoine PATUREL | [@Washer34](@Washer34) |

## Acknowledgements

Images are generated by IA.
Based on Bootstrap template.

## The Hacking Project

The Hacking project is an intensive tech bootcamp that works without teacher nor school. The strength of THP is its community. Indeed, THP relies on peer-learning to pass on skills and knowledges. To know more, click on the link on the banner.

## Getting Started

To get started with our Ruby on Rails app, follow these simple steps:

1. **Installation**: Make sure you have Ruby version 3.0.0 and Rails version 7.0.5 installed on your system.

2. **Clone the Repository**: Clone this repository to your local machine using the following command:
`git clone https://github.com/Demonelfes/Caravan_THP_Project.git`

3. **Setup Database**: Run the following commands to create and set up the database:
`sudo service postgresql start`
`rails db:create`
`rails db:migrate`

4. **Install Dependencies**: Install the required dependencies by running:
`bundle install`

5. **Start the Server**: Start the Rails server using the command:
`rails server`

6. **Access the App**: Open your web browser and visit http://localhost:3000 to access the CaraVan app.

7. **Explore and Enjoy**: Explore the app's features, search for available campervans, make reservations, and start planning your next adventure!
