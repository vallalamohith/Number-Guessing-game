<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Number Guessing Game</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f3f4f6;
            color: #333;
            margin: 0;
            padding: 0;
        }
        fieldset {
            display: inline-block;
            border: 2px solid #4CAF50;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }
        h1 {
            color: #4CAF50;
        }
        .message {
            font-size: 1.2em;
            margin: 10px 0;
        }
        .message.correct {
            color: green;
        }
        .message.close {
            color: orange;
        }
        .message.wrong {
            color: red;
        }
        input[type="number"] {
            width: 50%;
            padding: 10px;
            margin: 10px 0;
            font-size: 1em;
        }
        button {
            padding: 10px 20px;
            font-size: 1em;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .reset-button {
            background-color: #f44336;
        }
        .reset-button:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
    <form action="main" method="post">
        <fieldset>
            <h1>Number Guessing Game</h1>
            <p>Computer: "I have selected a number between 1 and 100. Can you guess it?"</p>
            <% 
                String message = (String) request.getAttribute("key");
                if (message != null) {
            %>
                <div class="message">
                    <%= message %>
                </div>
            <% } %>
            <label for="number">Enter your guess:</label>
            <input type="number" id="number" name="number" placeholder="Guess the number" min="1" max="100" required>
            <br><br>
            <button type="submit">Submit</button>
             
        </fieldset>
    </form>
</body>
</html>
