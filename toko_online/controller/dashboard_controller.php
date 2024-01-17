<?php
date_default_timezone_set("Asia/Jakarta");
if (!isset($_SESSION)) {
  session_start();
}

require_once "controller/base_controller.php";

class DashboardController
{
  function callasset()
  {
    $baseController = new BaseController();
    $baseController->callasset();
  }
  function get_dashboard()
  {
    require "koneksi.php";
    $dashboard = mysqli_query($connect, "SELECT
        b.nama_barang,
        COALESCE(penj.omset, 0) - COALESCE(pemb.cost, 0) AS keuntungan,
        COALESCE(pemb.jumlah_pembelian, 0) - COALESCE(penj.jumlah_penjualan, 0) AS stok,
        COALESCE(pemb.jumlah_pembelian, 0) AS jumlah_pembelian,
        COALESCE(penj.jumlah_penjualan, 0) AS jumlah_penjualan 
    FROM
        barang b
        LEFT JOIN (
        SELECT
            a.id_barang,
            a.nama_barang,
            SUM( a.jumlah_pembelian ) AS jumlah_pembelian,
            SUM( a.cost ) AS cost 
        FROM
            (
            SELECT
                b.id_barang,
                b.nama_barang,
                pemb.jumlah_pembelian AS jumlah_pembelian,
                pemb.jumlah_pembelian * pemb.harga_beli AS cost 
            FROM
                pembelian pemb
                INNER JOIN barang b ON b.id_barang = pemb.id_barang
            ) a 
        GROUP BY
            id_barang
        ) pemb ON b.id_barang = pemb.id_barang
        LEFT JOIN (
        SELECT
            a.id_barang,
            a.nama_barang,
            SUM( a.jumlah_penjualan ) AS jumlah_penjualan,
            SUM( a.omset ) AS omset 
        FROM
            (
            SELECT
                b.id_barang,
                b.nama_barang,
                penj.jumlah_penjualan AS jumlah_penjualan,
                penj.jumlah_penjualan * penj.harga_jual AS omset 
            FROM
                penjualan penj
                INNER JOIN barang b ON b.id_barang = penj.id_barang 
            ) a 
        GROUP BY
            id_barang 
        ) penj ON b.id_barang = penj.id_barang 
    GROUP BY
        b.id_barang;
    ;");
    return $dashboard;
  }
}