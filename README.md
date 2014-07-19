QuizApp
=======

## Overview

A simple iOS application to administer multiple choice quizzes to the
user. Quizzes are stored as JSON files. Users may take the quizzes that are
bundled with the app or import quizzes from URLs.

Two quizzes (quiz1.json and quiz2.json) are bundled together with the app. A
downloadable quiz is also located at
[http://goo.gl/7x95J8](http://goo.gl/7x95J8).

## Quiz and Quiz Menu JSON Format

Each quiz JSON file adheres to the following format, which slightly differs from
the class standard:

```javascript
{
    "key": "Quiz",
    "name": "Quiz 1",
    "description": "A simple quiz",
    "items": [
        {
            "question": "Question 1",
            "choices": ["choice 1", "choice 2", "choice 3", "choice 4"],
            "answer": 0
        },
        {
            "question": "Question 2",
            "choices": ["choice 1", "choice 2", "choice 3", "choice 4"],
            "answer": 3
        }
    ]
}
```

The "answer" is the index of the correct choice in the "choices" array.

The quiz menu JSON file adheres to the class standard.

## Notes

- *QuizApp currently supports up to five choices per question.*
- QuizApp will import improperly formatted JSON quizzes, but attempting to take
  them will likely cause the app to crash.
- When QuizApp starts, quizMenu.json is copied from the application bundle
  to the Documents directory on the device if it does not exist in the Documents
  directory. The two bundled quizzes are also copied over but will overwrite any
  existing files with the same name.
- Quizzes imported from URLs are downloaded to the Documents directory. QuizApp
  will use the "name" field of the quiz as the filename of the downloaded file
  and will overwrite any existing files with the same name. For example, a quiz
  with a name field of "Online Quiz" will be saved to "Documents/Online
  Quiz.json".
- To start QuizApp from a fresh state, remove all files from the Documents
  directory.
