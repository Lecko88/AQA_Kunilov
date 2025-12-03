Asynchronous Qt Assignment representing a user interface of a medical device

I have implemented almost everything except for a few details (the 3-hour limit was really tight):
I missed the deadline for implementing the avatar animation and completed it about five minutes later.
I noticed that the “leaf” icon (the image for “senior”) uses different colors in day and night modes. I know how to implement this, but I didn’t have enough time.
The markup is not perfect: the spacing between elements is slightly larger than in the Figma prototype, and the positions of the avatar and the pulsing image are not fully accurate.
I didn’t install the proper font.

As external sources I used the official Qt documentation available in Qt Explorer, Qt 6 C++ GUI Programming Cookbook (Kindle Edition), and my notes from previous work with Qt and QML. I used https://fontawesome.com/ to find the necessary icons. I also used Google Search to learn more about fonts in QML applications. No AI tools were used.

What I enjoyed
- Working on something that feels like a real medical device application.
- Having to apply a wide range of QML skills — from layouts to animations.
- Doing such a challenging task in just three hours.

Possible improvements

- I don’t like using “magic numbers” in QML code. For an AQA assignment it’s acceptable, but in a real project one should create a singleton Constants.qml and store all constants there.
Estimated time: 30 minutes.

- Implement different day/night colors for the background image.
Estimated time: 30 minutes.

- There are two very similar Repeaters in the QML code. In a real project they could be extracted into a separate QML component (according to the DRY principle).
Estimated time: 1 hour.

- I didn’t have time to verify this, but every QML component used in testing should have a clear identifier — id, objectName, or other attributes. This is critical for Squish tests.
Estimated time: 30 minutes.

- The buttons in the design are three-dimensional and have shadows. Their pressed state should be animated to reflect visual feedback on tap.
Estimated time: 30–45 minutes.

- The UI should clearly indicate which planet and which age group are currently selected.
Estimated time: 45 minutes

- It is good practice to describe UI behavior using a state machine. In this assignment we only have two states and one boolean variable, but real UI logic is often much more complex. Please consider the article written by me and my colleague: https://medium.com/@kunilov/a-working-example-of-using-state-machines-in-qml-d9524a6711d9
Estimated time: a few hours depending on UI complexity.

Instructions to build the application:
1. Clone the project
git clone https://github.com/Lecko88/AQA_Kunilov.git
cd AQA_Kunilov/AQA_Kunilov

2. Requirements
Make sure you have:
- Qt 6.8
- Qt Quick
- Qt QML
- Qt Quick Controls
- Qt SVG 
- CMake 3.16+
- A C++17 compiler (MSVC / MinGW / GCC)
Qt Creator is recommended but optional.

3. Configure the build
mkdir build
cd build
cmake .. -DCMAKE_PREFIX_PATH="path/to/Qt/6.x.x/<compiler>"

4. Build 
cmake --build .

5. Run
appAQA_Kunilov.exe

Instructions to run the pre-build application:
1. Clone the project
git clone https://github.com/Lecko88/AQA_Kunilov.git
cd AQA_Kunilov

2. Extract package.zip

3. cd package

4. Run appAQA_Kunilov.exe
