# fetchRecipes

# Summary
This is a basic recipe viewer app that retrieves recipes from a remote API and presents them in a SwiftUI list. The user can see recipes, their cuisine type and images, and refresh the list via pull-to-refresh. The app adheres to best practices for Swift Concurrency (async/await) and uses custom image caching. The project includes unit tests to validate network responses and error handling.

# Focus Areas
I designed a minimalistic and clean user interface with SwiftUI, keeping in mind modern design principles to ensure a smooth user experience. I utilized Swift Concurrency with async/await to ensure efficient asynchronous programming for optimum network handling. For performance optimization, I developed a custom image caching mechanism, which eliminated duplicate network requests and enhanced loading times. I also concentrated extensively on end-to-end error handling, thereby ensuring effective resolution of errors such as malformed JSON and missing data, and consequently, improved overall reliability and customer satisfaction.

# Time Spent
UI development took approximately two hours, while networking and data handling were completed in about one hour. Error handling and addressing edge cases required an additional hour. Unit testing took another hour, and final documentation and refinements were completed within the last hour.

# Trade-offs and Decisions
Employed Custom Image Caching instead of internal caching to have more control on storing images.
Limited UI Enhancements to keep the app clean and simple.
No external libraries were used as per the assignment requirement.

# Weakest Part of the Project
Although the app is good at dealing with errors, it is possible to return users more descriptive error messages. 
The ability to sort, filter, or have a detail view for recipes would be more usable.

