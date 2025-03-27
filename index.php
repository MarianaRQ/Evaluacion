<?php
require_once '../src/models/Propietario.php';
$propietarioModel = new Propietario($pdo);
$propietarios = $propietarioModel->obtenerPropietarios();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión Piscícola</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="mt-4">Sistema de Gestión Piscícola</h1>

        <table class="table table-striped mt-4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Contacto</th>
                    <th>Dirección</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($propietarios as $propietario) : ?>
                    <tr>
                        <td><?= $propietario['id'] ?></td>
                        <td><?= $propietario['nombre'] ?></td>
                        <td><?= $propietario['contacto'] ?></td>
                        <td><?= $propietario['direccion'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</body>
</html>
