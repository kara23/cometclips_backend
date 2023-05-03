<?php

namespace helper\Validate;

require "config/db.php";
class ValidateData
{
    // validate data input
    function validateInput($name, $email, $phone_number, $message)
    {
        if (empty(trim($name)) || empty(trim($email))  || empty(trim($phone_number)) || empty(trim($message))) {
            http_response_code(500);
            $response = ['message' => 'All fields are required.', "status" => false];
            echo json_encode($response);
            return false;
        }


        if (filter_var($email, FILTER_VALIDATE_EMAIL) === FALSE) {
            http_response_code(500);
            $response = ['message' => 'Please enter a valid email address.', "status" => false];
            echo json_encode($response);
            return false;
        }

        $phone = preg_replace('/[^0-9]/', '', $phone_number);
        if ((substr($phone, 0, 2) != '27') || strlen($phone) != 11) {
            http_response_code(500);
            $response = ['message' => 'Please enter a valid phone number.', "status" => false];
            echo json_encode($response);
            return false;
        }

        return true;
    }

    // check if email already exist
    function isEmailExists($email)
    {
        global $conn;
        $selectQuery = $conn->prepare("SELECT email FROM users WHERE email=?");
        $selectQuery->bind_param('s', $email);
        $selectQuery->execute();
        $results = $selectQuery->get_result();
        if (mysqli_num_rows($results) == 1) {
            http_response_code(500);
            $response = ['message' => 'Email address already exists.', "status" => false];
            echo json_encode($response);
            return false;
        }

        return true;
    }
}
