# 📝 Todo App

## Overview

Welcome to the Todo App! This app is designed to help you manage your tasks efficiently, with a clean and modular code architecture.

## Project Structure

The project is organized into the following directories and files:

### 📁 http

- **`api_constants.dart`**: Stores constants related to API endpoints and configurations.
- **`api_service.dart`**: Contains the logic for making API requests and fetching the todo list from the server.

### 📁 models

- **`Todo.dart`**: Defines the `Todo` model class used to represent todo items.

### 📁 screen

- **`app_update_todo.dart`**: Contains logic for adding and updating todo items.
- **`todo_list.dart`**: Contains logic for displaying the todo list.

### 📁 widget

- **`app_bar_widget.dart`**: Contains a custom app bar widget.
- **`todo_list_item.dart`**: Contains a widget for displaying a single todo list item.

## Getting Started

Follow these steps to get started with the project:

1. **Clone the repository**:
    ```bash
    git clone <repository_url>
    ```

2. **Navigate to the project directory**:
    ```bash
    cd todo_app
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Run the app**:
    ```bash
    flutter run
    ```

## Usage

### ➕ Adding a Todo Item

1. Navigate to the add/update todo screen.
2. Enter the details of the todo item.
3. Save the todo item.

### ✏️ Updating a Todo Item

1. Select the todo item from the list.
2. Navigate to the add/update todo screen.
3. Update the details and save.

### 📋 Viewing the Todo List

Navigate to the todo list screen to view all the todo items.

## API Integration

The app fetches the todo list from a server using the API service defined in `api_service.dart`. Update the API endpoint and configurations in `api_constants.dart`.

## Custom Widgets

- **App Bar Widget**: The custom app bar widget is defined in `app_bar_widget.dart`.
- **Todo List Item**: The widget for displaying a single todo list item is defined in `todo_list_item.dart`.

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a pull request.

For major changes, please open an issue to discuss what you would like to change.

## License

This project is licensed under the MIT License.
