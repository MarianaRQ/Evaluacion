<?php
require_once __DIR__ . '/../config/database.php';

class Propietario {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function agregarPropietario($nombre, $contacto, $direccion) {
        $sql = "INSERT INTO propietarios (nombre, contacto, direccion) VALUES (:nombre, :contacto, :direccion)";
        $stmt = $this->pdo->prepare($sql);
        return $stmt->execute([':nombre' => $nombre, ':contacto' => $contacto, ':direccion' => $direccion]);
    }

    public function obtenerPropietarios() {
        $sql = "SELECT * FROM propietarios";
        $stmt = $this->pdo->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>
