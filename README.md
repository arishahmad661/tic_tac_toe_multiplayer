# Tic Tac Toe Multiplayer App

Welcome to the Tic Tac Toe Multiplayer App! This Flutter-based application allows users to enjoy the classic game of Tic Tac Toe both online and offline. The app incorporates various technologies, including Flutter, Firebase, MongoDB, Node.js, and GetX, to provide a seamless and engaging gaming experience.

## Features
<!-- **Authentication:** Firebase authentication services are utilized for secure and easy user authentication.-->
- **Online and Offline Play:** Users can choose to play against friends online or offline, offering versatility in gameplay.
- **Real-time Multiplayer:** Real-time multiplayer functionality is achieved using Socket.IO and Node.js, enabling players to compete with each other seamlessly.
- **Data Storage:** Room data, including game progress and player information, is stored in MongoDB, ensuring data integrity and persistence.
- **State Management:** GetX is used for efficient state management, handling game state, wins, and draws effectively.

## Installation and Setup

Follow these steps to set up and run the Tic Tac Toe Multiplayer App locally:

1. **Clone the Repository:** <br/>
    ``git clone https://github.com/your-username/tic-tac-toe-multiplayer.git``


3. **Navigate to the Project Directory:**<br/>
   ``cd tic-tac-toe-multiplayer``


4. **Install Dependencies:**<br/>
    ``flutter pub get``


5. **Set Up Firebase:**
- Create a new Firebase project and download the `google-services.json` file.
- Place the `google-services.json` file in the `android/app` directory.

5. **Configure MongoDB:**
- Update the MongoDB connection settings in the Node.js backend (located in the backend directory).

6. **Run the Node.js Backend:**<br/>
``npm install``<br/>
``npm run dev``<br/>


7. **Run the Flutter App:**
``flutter run``


## Screenshots

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:
1. Fork the repository.
2. Create a new branch: `git checkout -b feature-new-feature`
3. Make your changes and commit them: `git commit -am 'Add new feature'`
4. Push the branch: `git push origin feature-new-feature`
5. Submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions or suggestions, feel free to reach out to us at your-email@example.com.

Happy gaming!
