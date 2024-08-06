# bloc_todo_app

Step 1: Set Up Your Development Environment
Install Flutter

If you haven't already, install Flutter by following the official installation guide: Flutter Installation Guide.

Set Up an Editor

Install an editor such as Visual Studio Code or Android Studio. Make sure to install the Flutter and Dart plugins/extensions for your chosen editor.

Clone or Create Your Project

If you haven't already created the project, you can clone the repository or create a new Flutter project:

shell
Copy code
flutter create todo_list_app
cd todo_list_app
Step 2: Update pubspec.yaml
Make sure your pubspec.yaml file includes all the necessary dependencies:

yaml
Copy code
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.0.0
  equatable: ^2.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.0.15
  bloc_test: ^8.0.0
Run flutter pub get to install the dependencies.

Step 3: Run the App
Open Your Project in an Editor

Open your project in Visual Studio Code, Android Studio, or your preferred editor.

Connect a Device

Connect an Android/iOS device to your computer or start an emulator/simulator.

Run the App

Use the following command to run the app:

shell
Copy code
flutter run
Alternatively, you can use the editor's built-in functionality to run the app (e.g., press F5 in Visual Studio Code).

Step 4: Running Unit and Widget Tests
Run All Tests

Use the following command to run all tests:

shell
Copy code
flutter test
Run Specific Test Files

To run a specific test file, use the following command:

shell
Copy code
flutter test test/domain/usecases/add_task_test.dart
flutter test test/presentation/pages/task_page_test.dart
Step 5: Using the App
Once the app is running, you can interact with it as follows:

Add a New Task

Tap the floating action button (+ icon) to open the dialog for adding a new task.
Enter the task title and press "Add".
Mark a Task as Completed

Tap the checkbox next to a task to mark it as completed.
Delete a Task

Tap the delete (trash) icon next to a task to delete it.
Filter Tasks

Use the popup menu in the app bar to filter tasks by "All", "Completed", or "Pending".
Summary
Install Flutter and set up your development environment.
Create or open the project in your preferred editor.
Run the app using flutter run.
Execute unit and widget tests using flutter test.
Interact with the app to add, complete, delete, and filter tasks.
By following these steps, you can run and test your To-Do List app, ensuring it meets all the requirements specified.
