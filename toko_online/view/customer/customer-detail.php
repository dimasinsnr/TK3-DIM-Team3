<?php
require_once "controller/customer_controller.php";
$customerController = new CustomerController();
$customerController->callasset();

$customerDetail = null;
if (isset($_GET['id'])) {
  $customerDetail = $customerController->customer_detail($_GET['id']);
}
?>
<html>

<head>
</head>

<body>
  <div class="clm-12" style="margin-top: 10px;">
    <h1>
      <?php echo $customerDetail != null ? "Edit Customer" : "Tambah Customer" ?>
    </h1>
  </div>
  <form action="submit.php" method="post" enctype="multipart/form-data">
    <?php if ($customerDetail): ?>
      <input type="hidden" name="id_customer" value="<?php echo $customerDetail[0]['id_customer'] ?>">
    <?php endif ?>
    <table class="table">
      <tr>
        <td style="text-align: left; border-top: none"><b>Nama Customer : </b></td>
        <td style="border-top: none"><input type="text" class="input" name="nama_customer"
            value="<?php echo $customerDetail != null ? $customerDetail[0]['nama_customer'] : '' ?>" autocomplete="off"
            required /></td>
      </tr>
      <tr>
        <td style="text-align: left;"><b>No HP : </b></td>
        <td><input type="tel" pattern="[0-9]*" class="input" name="no_hp_customer"
            value="<?php echo $customerDetail != null ? $customerDetail[0]['no_hp_customer'] : '' ?>" autocomplete="off"
            required /></td>
      </tr>
      <tr>
        <td style="text-align: left;"><b>Alamat Customer : </b></td>
        <td>
          <textarea class="input" name="alamat_customer" autocomplete="off"
            required><?php echo $customerDetail != null ? $customerDetail[0]['alamat_customer'] : '' ?></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:right">
          <?php if ($customerDetail): ?>
            <input type="submit" name="customer-edit-submit" class="btn btn-success" style="width:100px;" value="Edit">
          <?php endif ?>
          <?php if ($customerDetail == null): ?>
            <input type="submit" name="customer-add-submit" class="btn btn-success" style="width:100px;" value="Add">
          <?php endif ?>
          <a href="?page=customer&&subpage=customer-list"><input type="button" class="btn btn-danger"
              style="width:100px;" value="Cancel"></a>
        </td>
      </tr>
    </table>
  </form>
</body>

</html>