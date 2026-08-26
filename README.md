# zlts_test

A Flutter assignment project built using the NYC 311 public API.

The idea for this project came from looking at ZLTS product, PureSect. While exploring the product, I noticed the complaint-related snapshot on the website, which gave me the idea to build a simple complaint listing app around a similar concept.

My main focus for this assignment was to understand and implement the Flutter architecture discussed during the call, including the service layer, repository layer, presentation layer, state management, and separate layouts for mobile and web.

## Features

- Fetch complaint data from a public API
- Separate layouts for mobile and web
- Cubit for state management
- Service layer
- Repository layer
- Loading and error states
- Reusable complaint card
- Responsive web layout

## Packages Used

- flutter_bloc - Used Cubit for managing the application state
- http` - Used to make API requests

## API Used

NYC 311 Open Data API

I used the NYC 311 public API because it provides a real list of complaints with useful information such as complaint type, description, status, agency, borough, and date.

I chose this API after looking at PureSect and seeing the complaint-related part of the product. It gave me the idea to build this assignment around a complaint listing concept instead of using a random API.

The API data is fetched through the service layer, passed to the repository, and then handled by the Cubit before being displayed in the UI.

## Screenshots

### Mobile

![Mobile Screenshot](screenshots/mobile.png)

### Web

![Web Screenshot](screenshots/web.png)

## Note

I kept the UI simple and focused more on the functionality and structure of the application because of the limited assignment time.

The main focus was on understanding and implementing the API integration, service and repository layers, Cubit state management, and separate layouts for mobile and web.

## Possible Improvements

If I had more time, I would improve the UI and add features such as better filtering, search, and a more detailed complaint view.