<?php

namespace Entries;

use Exception;

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header('Content-type: application/json');

require "config/db.php";


class Entries
{
    public function list()
    {
        global $conn;
        try {
            $select = "SELECT * FROM users ORDER BY created_at DESC";
            $select = $conn->prepare($select);
            $select->execute();
            $results = $select->get_result();
            $data = [];
            while ($rows = $results->fetch_assoc()) {
                $data[] = [
                    'name' => ucwords($rows['name']),
                    'phoneNumber' => $rows['phone_number'],
                    'email' => $rows['email'],
                    'message' => $rows['message']
                ];
            }
            echo json_encode(['users' => $data]);
            return true;
        } catch (Exception $e) {
            echo json_encode(['message' => $e->getMessage()]);
            return true;
        }
    }
}

// list all entries
if ($_SERVER['REQUEST_METHOD'] === 'GET') {

    $entries = new Entries;
    $entries->list();
    return true;
} else {

    http_response_code(405);
    $response = ["message" => $_SERVER['REQUEST_METHOD'] . " method is not allowed"];
    echo json_encode($response);
    return false;
}
