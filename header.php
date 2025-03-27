<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard con Aside</title>
    <link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>


<body>
    <!-- Menú Lateral -->
    <aside>
        <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-smooth-scroll="true"
            class="scrollspy-example text-center" tabindex="0">
            <img src="{{ url_for('static', filename='imagenes/logo.png') }}" class="logo" alt="Logo">
        </div>

        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link" href="{{ url_for('rutas.home') }}">🏠 Inicio</a></li>
            <li class="nav-item"><a class="nav-link " href="{{ url_for('rutas.facturas') }}">📄 Facturas</a>
            </li>
            <li class="nav-item"><a class="nav-link " href="{{ url_for('rutas.categorias') }}">📁 Categorías de
                    Productos</a></li>
            <li class="nav-item"><a class="nav-link " href="#">⚙ Configuración</a></li>
        </ul>

        <hr>

        <!-- Sección de Estadísticas -->
        <h4>📈 Reportes</h4>
        <div class="stats" data-bs-toggle="modal" data-bs-target="#modal-fullscreen" data-src="/dashboard/productos">
            <p>Artículo más vendido</p>
        </div>

        <div class="stats" data-bs-toggle="modal" data-bs-target="#modal-fullscreen" data-src="/dashboard/utilidades">
            <p>Utilidades por unidad</p>
        </div>
        <div class="stats" data-bs-toggle="modal" data-bs-target="#modal-fullscreen" data-src="/dashboard/datos">
            <p>Empresa o persona que más factura (cantidad de facturas)</p>
        </div>
        <div class="stats" data-bs-toggle="modal" data-bs-target="#modal-fullscreen" data-src="/dashboard/ventas">
            <p>Empresa o persona que más factura (volumen de ventas en pesos)</p>
        </div>
        <div class="stats" data-bs-toggle="modal" data-bs-target="#modal-fullscreen" data-src="/dashboard/inventarios">
            <p>Productos sin existencia</p>
        </div>
    </aside>

    <!-- Contenido Principal -->
    <main>
        <nav class="navbar">
            <div class="container-fluid">
                <div class="iconos">
                    <i class="bi bi-person-circle"></i>
                    <i class="bi bi-calendar-date"></i>
                    <i class="bi bi-bell-fill"></i>

                </div>

                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Buscar">
                    <button class="btn btn-primary" type="submit">Buscar</button>
                </form>
            </div>
        </nav>