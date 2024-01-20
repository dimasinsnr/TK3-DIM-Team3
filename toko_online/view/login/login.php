<?php
require_once "controller/pembelian_controller.php";
$pembelianController = new PembelianController();
$pembelianController->callasset();
$pembelian_list = $pembelianController->pembelian_list();
?>
<html>

<head>
</head>
<body>
    <div class="container">
        <div class="card" style="background-color: red; width: 50px; height: 50px;">

        </div>
    </div>
</body>

</html>