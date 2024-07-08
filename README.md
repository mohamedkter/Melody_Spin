
![alt text](<app look.png>)

Melody Spin - Movie Discovery and Management App

Overview :

Melody Spin is a mobile application designed to help users discover, search for, and save their favorite movies. The app also provides detailed information about actors and the films they have worked in. It incorporates several advanced features to enhance user experience.

Features
Movie Search and Display:

Search Functionality: Users can search for movies by title, genre, or release date.
Movie Details: Display detailed information about each movie including synopsis, release date, genre, and rating.
Actor Information:

Actor Profiles: View detailed profiles of actors including their biography, filmography, and other related information.
Related Movies: Discover other movies featuring the same actors.
Favorites and Watchlist:

Save Movies: Users can save their favorite movies or add them to a watchlist for future reference.
Easy Access: Quickly access saved movies and watchlist from a dedicated section in the app.
User Interface:

Intuitive Design: A clean and intuitive user interface for easy navigation and better user experience.
Responsive Layout: Optimized for different screen sizes and orientations.
Technology Stack
Flutter:

Widget-Based UI: Implement a widget-based approach for building a responsive and dynamic user interface.

Dio:
HTTP Requests: Use Dio for making network requests to fetch data from the TMDb API.
Error Handling: Efficient handling of errors and exceptions during API calls.
BLoC (Business Logic Component):

State Management: Implement BLoC for managing the state of the application, ensuring a clear separation between the presentation and business logic.
Reactive Programming: Use reactive programming principles for better performance and scalability.
TMDb API Integration:

Movie Data: Fetch detailed movie information, actor profiles, and other related data from the TMDb (The Movie Database) API.
Real-Time Updates: Ensure that the app provides up-to-date information by leveraging the extensive dataset available through TMDb.

Additional Libraries and Tools 
Sqlite: For local storage of user data such as favorites and watchlist.
