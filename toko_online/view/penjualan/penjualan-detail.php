<?php
require_once "controller/penjualan_controller.php";
require_once "controller/customer_controller.php";
require_once "controller/barang_controller.php";

$penjualanController = new PenjualanController();
$penjualanController->callasset();

$penjualanDetail = null;
if (isset($_GET['id'])) {
  $penjualanDetail = $penjualanController->penjualan_detail($_GET['id']);
}

$customerController = new CustomerController();
$customerList = $customerController->customer_list();

$barangController = new BarangController();
$barangList = $barangController->barang_list();
?>
<html>

<head>
</head>

<body>
  <div class="clm-12" style="margin-top: 10px;">
    <h1>
      <?php echo $penjualanDetail != null ? "Edit Penjualan" : "Tambah Penjualan" ?>
    </h1>
  </div>
  <form action="submit.php" method="post" enctype="multipart/form-data">
    <?php if ($penjualanDetail): ?>
      <input type="hidden" name="id_penjualan" value="<?php echo $penjualanDetail[0]['id_penjualan'] ?>">
    <?php endif ?>
    <table class="table">
      <tr>
        <td style="text-align: left; border-top: none"><b>Barang : </b></td>
        <td style="border-top: none">
          <select name="id_barang" class="input" required>
            <?php foreach ($barangList as $barang): ?>
              <option value="<?php echo $barang['id_barang']; ?>" <?php if ($penjualanDetail != null && $barang['id_barang'] == $penjualanDetail[0]['id_barang']) {
                   echo "selected";
                 } ?>><?php echo $barang['nama_barang'] . " (" . $barang["satuan"] . ")"; ?>
              </option>
            <?php endforeach ?>
          </select>
        </td>
      </tr>
      <tr>
        <td style="text-align: left;"><b>Harga Jual : </b></td>
        <td><input type="text" class="input" name="harga_jual"
            value="<?php echo $penjualanDetail != null ? $penjualanDetail[0]['harga_jual'] : '' ?>" autocomplete="off"
            required /></td>
      </tr>
      <tr>
        <td style="text-align: left;"><b>Jumlah Penjualan : </b></td>
        <td><input type="text" class="input" name="jumlah_penjualan"
            value="<?php echo $penjualanDetail != null ? $penjualanDetail[0]['jumlah_penjualan'] : '' ?>"
            autocomplete="off" required /></td>
      </tr>
      <tr>
        <td style="text-align: left;"><b>Nama Toko : </b></td>
        <td>
          <select name="id_customer" class="input" required>
            <?php foreach ($customerList as $customer): ?>
              <option value="<?php echo $customer['id_customer']; ?>" <?php if ($penjualanDetail != null && $customer['id_customer'] == $penjualanDetail[0]['id_customer']) {
                   echo "selected";
                 } ?>><?php echo $customer['nama_customer']; ?>
              </option>
            <?php endforeach ?>
          </select>
        </td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:right">
          <?php if ($penjualanDetail): ?>
            <input type="submit" name="penjualan-edit-submit" class="btn btn-success" style="width:100px;" value="Edit">
          <?php endif ?>
          <?php if ($penjualanDetail == null): ?>
            <input type="submit" name="penjualan-add-submit" class="btn btn-success" style="width:100px;" value="Add">
          <?php endif ?>
          <a href="?page=penjualan&&subpage=penjualan-list"><input type="button" class="btn btn-danger"
              style="width:100px;" value="Cancel"></a>
        </td>
      </tr>
    </table>
  </form>
</body>

</html>