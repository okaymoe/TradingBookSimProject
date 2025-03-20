# Trading Port

**Trading Port** is a desktop trading simulation application developed to sharpen my C++ skills while exploring modern UI technologies. This project utilizes Qt (QML/Qt Quick), C++, and CMake to build a cross-platform application with a sleek, modern design.

## Overview

Trading Port is a personal learning project designed to simulate a trading environment. It features:
- **Live Stock Data:** Fetches stock prices using free API integration.
- **Order Entry & History:** Allows you to place simulated orders and view your order history.
- **Portfolio Management:** Starts with an initial balance (e.g., $100,000) and tracks your holdings.
- **Multi-View Interface:** Includes separate views for trading, portfolio analytics, charts, and settings.
- **Modern UI:** Built with QML and Qt Quick Controls featuring a dark theme and side navigation.

## Technologies Used

- **C++** – Core business logic and application framework.
- **Qt 6** – For the UI and cross-platform application support.
- **QML / Qt Quick** – For designing a responsive and modern user interface.
- **CMake** – Build system for project configuration.
- **Qt Network** – To fetch live data from free APIs (e.g., Alpha Vantage).
- **Qt Charts** – (Planned) For displaying live trading charts and analytics.

## Setup & Installation

1. Clone the Repository: Run the following command in your terminal: ```git clone https://github.com/your_username/TradingProject.git```

2. **Open the Project:**

   Open the project in Qt Creator or your preferred IDE that supports CMake and Qt.

3. **Configure and Build:**

   - Configure the project with CMake.
   - Build the project using your chosen build kit.

4. **Run the Application:**

   Launch the built executable to start Trading Port.

## Usage

### Navigation

Use the side navigation panel to switch between Trading, Portfolio, Analytics, and Settings views.

### Trading Tab

- **Live Stock Data:** View live stock data.
- **Order Entry:** Place orders using the order entry panel.
- **Order History:** Review recent orders in the order list.

### Portfolio Tab

- **Available Funds:** View your available funds.
- **Holdings:** See your current holdings and their calculated values.
- **Simulated Growth:** Add funds to simulate portfolio growth.

### Analytics & Settings Tabs

- **Analytics:** (Planned) Live charting and portfolio analytics.
- **Settings:** (Planned) Application settings and preferences.

## Contributing

This project is a personal learning exercise. Contributions for improvements or additional features are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.

## Acknowledgements

Special thanks to the Qt community and official documentation for guidance, and a couple of YouTube creators for a C++ refresh. Inspired by modern trading applications and best practices in C++ and QML.
