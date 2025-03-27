<?php
// Configuración de la base de datos
$host = "localhost";
$dbname = "gestion_piscicola";
$user = "root";  // Cambia esto si tienes otro usuario
$password = "";  // Si tienes una contraseña, agrégala aquí

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("❌ Error de conexión: " . $e->getMessage());
}
?>
