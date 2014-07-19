QuizApp
=======

A simple iOS application to administer quizzes to the user. Quizzes are stored
as JSON files. Users may take the quizzes that are bundled with the app or
import quizzes from URLs.

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
            "choices": ["choice 1", "choice 2", "choice 3", choice 4"],
            "answer": 0
        },
        {
            "question": "Question 2",
            "choices": ["choice 1", "choice 2", "choice 3", choice 4"],
            "answer": 3
        }
    ]
}
```

QuizApp currently supports up to five choices per question. The "answer" is the
index of the correct choice in the "choices" array.

The quiz menu JSON file adheres to the class standard.
