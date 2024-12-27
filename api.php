<?php
header("Content-Type: application/json");
include 'connect.php';

$method = $_SERVER['REQUEST_METHOD'];
$input = json_decode(file_get_contents('php://input'), true);

switch ($method) {
    case 'GET':
        handleGet($pdo);
        break;
    case 'POST':
        handlePost($pdo, $input);
        break;
    case 'PUT':
        handlePut($pdo, $input);
        break;
    case 'DELETE':
        handleDelete($pdo, $input);
        break;
    default:
        echo json_encode(['message' => 'Invalid request method']);
        break;
}

function handleGet($pdo) {
    try {
        $sql = "SELECT id, Email, Username, Role, Joindate, Address, points FROM user";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($result);
    } catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}

function handlePost($pdo, $input) {
    try {
        $sql = "INSERT INTO user (Email, Username, Password, Role, Joindate, Address, points) 
                VALUES (:email, :username, :password, :role, NOW(), :address, :points)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'email' => $input['Email'],
            'username' => $input['Username'],
            'password' => password_hash($input['Password'], PASSWORD_BCRYPT), // Secure password hashing
            'role' => $input['Role'],
            'address' => $input['Address'],
            'points' => $input['points']
        ]);
        echo json_encode(['message' => 'User created successfully']);
    } catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}

function handlePut($pdo, $input) {
    try {
        $sql = "UPDATE user SET Email = :email, Username = :username, Role = :role, Address = :address, points = :points 
                WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'email' => $input['Email'],
            'username' => $input['Username'],
            'role' => $input['Role'],
            'address' => $input['Address'],
            'points' => $input['points'],
            'id' => $input['id']
        ]);
        echo json_encode(['message' => 'User updated successfully']);
    } catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}

function handleDelete($pdo, $input) {
    try {
        $sql = "DELETE FROM user WHERE id = :id";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['id' => $input['id']]);
        echo json_encode(['message' => 'User deleted successfully']);
    } catch (Exception $e) {
        echo json_encode(['error' => $e->getMessage()]);
    }
}
?>
