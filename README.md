Stock Tracker Application

A simple stock tracking application that allows users to monitor product availability based on a provided link. This application helps users track when the stock of a particular product becomes available again, with a customizable notification system.

Features
	•	Product Link Input: Users can input a product URL from a supported website.
	•	Size Selection: The app prompts users to select a size for the product.
	•	Stock Tracking: If the product is out of stock, the app will start a tracking process for a specified period (e.g., 1 week).
	•	Stock Notification: When the product is back in stock, users are notified based on their preferred notification method (email, SMS, or in-app notification).

Requirements
	•	Flutter 3.0+
	•	Xcode (for iOS simulation)
	•	Android Studio or Visual Studio Code (for development)

Installation
	1.	Clone the repository:
    git clone https://github.com/yourusername/stock_tracker.git

    2.	Navigate to the project directory:
    cd stock_tracker

    3.	Install the dependencies:
    flutter pub get

    Usage
	1.	Run the application on an emulator or real device:
    flutter run
    	2.	Input the product URL when prompted.
	3.	Select the product size from the available options.
	4.	If the product is out of stock, you can choose a tracking period (e.g., 1 week) for when the app should check the stock status.
	5.	After the tracking period, you will be notified when the product is available again. Choose your preferred notification method (email, SMS, or in-app).

Contributing

Feel free to fork this repository and contribute! You can report bugs, add new features, or improve the code.