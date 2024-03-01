# Progress Tracker

progresstracker.dev is a Ruby on Rails and Turbo Native application
to track and log job applications, interviews, feedbacks and improvements.

## Technologies

- Ruby 3
- Rails 7
- Hotwire
  - Turbo
  - Stimulus
  - Turbo Native (turbo-ios)
  - Strada
- Swift

## Turbo Native

Turbo Native is a tool within the Hotwire suite, designed by the creators of Basecamp, that enables the creation of iOS and Android apps by leveraging web views from an existing Rails web application. Essentially, it allows web content to be embedded and displayed within a mobile app, making it appear and behave like native app content. This approach facilitates code reuse from web applications, providing a streamlined way to extend web functionality to mobile platforms without the need for duplicating business logic or creating separate mobile app versions from scratch.

By using Turbo Native, developers can significantly reduce development time and effort, as it enables the sharing of business logic and user interfaces between web and mobile applications. This not only simplifies maintenance but also ensures a consistent user experience across platforms. Turbo Native optimizes web content for mobile, offering smooth transitions and faster loading times, thereby enhancing the overall user experience and making web-based content feel native to the mobile environment.

- [turbo-ios](https://github.com/hotwired/turbo-ios)
- [turbo-android](https://github.com/hotwired/turbo-android)
