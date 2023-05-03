<?php

namespace newEntry;

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Content-type: application/json');

require "config/db.php";
require "helper/validate.php";

use Exception;
use helper\Validate\ValidateData;

$validate = new ValidateData;

class UserData
{
    public function store($name, $email, $phone_number, $message)
    {
        try {
            global $conn, $validate;
            $updated_at = date('Y-m-d H:i:s');

            // validate user input
            if (!$validate->validateInput($name, $email, $phone_number, $message)) {
                return false;
            }

            // check if email already exist
            if (!$validate->isEmailExists($email)) {
                return false;
            }

            // if all validations are successful, save new entry
            $insert = $conn->prepare("INSERT INTO users(name, email, phone_number, message, updated_at) VALUES(?, ?, ?, ?, ?)");
            $insert->bind_param('sssss', $name, $email, $phone_number, $message, $updated_at);
            $insert->execute();

            $response = ['message' => 'Entry successful!', "status" => true];
            echo json_encode($response);
            http_response_code(200);
            return true;
        } catch (Exception $e) {
            $response = ['message' => $e->getMessage(), "status" => false];
            echo json_encode($response);
            http_response_code(500);
            return false;
        }
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // receive data from users
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone_number = $_POST['phone_number'];
    $message = $_POST['message'];

    // store new entry
    $userData = new UserData;
    $userData->store($name, $email, $phone_number, $message);
    return;
} else {

    $response = ["message" => $_SERVER['REQUEST_METHOD'] . " is not allowed"];
    echo json_encode($response);
    http_response_code(405);
    return;
}
