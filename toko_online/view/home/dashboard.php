<?php
require_once "controller/dashboard_controller.php";
$dashboardController = new DashboardController();
$dashboardController->callasset();
$dashboard = $dashboardController->get_dashboard();
?>
<html>

<head>
</head>
<div class="clm-12 np">
  <div class="container-full" id="daftarproduk">
    <h1><b>Dashboard</b></h1>
    <input type="hidden" id="totalcheck" value="0" />
    <table class="table" style="margin-top:10px;">
      <?php if ($dashboard != null): ?>
        <thead>
          <th>No</th>
          <th>Nama Barang</th>
          <th>Jumlah Pembelian</th>
          <th>Jumlah Penjualan</th>
          <th>Stok</th>
          <th>Laba Rugi</th>
          <th>Keterangan</th>
        </thead>

        <?php $no = 1;
        foreach ($dashboard as $item): ?>
          <tr>
            <td>
              <?php echo $no;
              $no++ ?>
            </td>
            <td>
              <?php echo $item['nama_barang'] ?>
            </td>
            <td>
              <?php echo $item['jumlah_pembelian'] ?>
            </td>
            <td>
              <?php echo $item['jumlah_penjualan'] ?>
            </td>
            <td>
              <?php echo $item['stok'] ?>
            </td>
            <td>
              Rp<?php echo $item['keuntungan'] ?>
            </td>
            <td>
            <?php if ($item['keuntungan'] == 0): ?>
              <span style="background-color: #2596be; color: white; padding: 5px; border-radius: 8px;">Impas</span>
            <?php elseif ($item['keuntungan'] > 0): ?>
              <span style="background-color: #008c30; color: white; padding: 5px; border-radius: 8px;">Laba</span>
            <?php else : ?>
              <span style="background-color: #e5002d; color: white; padding: 5px; border-radius: 8px;">Rugi</span>
            <?php endif; ?>
            </td>
          </tr>
        <?php endforeach ?>
      <?php else: ?>
        <tr>
          <td colspan="7" style="text-align:center">Tidak Ada Data.</td>
        </tr>
      <?php endif ?>
    </table>
  </div>
</div>

</html>