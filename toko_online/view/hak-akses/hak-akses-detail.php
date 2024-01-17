<?php
require_once "controller/hak_akses_controller.php";
$hakAksesController = new HakAksesController();
$hakAksesController->callasset();

$hakAksesDetail = null;
if (isset($_GET['id'])) {
  $hakAksesDetail = $hakAksesController->hak_akses_detail($_GET['id']);
}
?>
<html>

<head>
</head>

<body>
  <div class="clm-12" style="margin-top: 10px;">
    <h1>
      <?php echo $hakAksesDetail != null ? "Edit Hak Akses" : "Tambah Hak Akses" ?>
    </h1>
  </div>
  <form action="submit.php" method="post" enctype="multipart/form-data">
    <?php if ($hakAksesDetail): ?>
      <input type="hidden" name="id_akses" value="<?php echo $hakAksesDetail[0]['id_akses'] ?>">
    <?php endif ?>
    <table class="table">
      <tr>
        <td style="text-align: left; border-top: none"><b>Nama Hak Akses : </b></td>
        <td style="border-top: none"><input type="text" class="form-control" name="nama_akses"
            value="<?php echo $hakAksesDetail != null ? $hakAksesDetail[0]['nama_akses'] : '' ?>" autocomplete="off"
            required /></td>
      </tr>
      <tr>
        <td style="text-align: left"><b>Keterangan : </b></td>
        <td>
          <textarea class="form-control" name="keterangan"
            autocomplete="off"><?php echo $hakAksesDetail != null ? $hakAksesDetail[0]['keterangan'] : '' ?></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:right">
          <?php if ($hakAksesDetail): ?>
            <input type="submit" name="hak-akses-edit-submit" class="btn btn-success" style="width:100px;" value="Edit">
          <?php endif ?>
          <?php if ($hakAksesDetail == null): ?>
            <input type="submit" name="hak-akses-add-submit" class="btn btn-success" style="width:100px;" value="Add">
          <?php endif ?>
          <a href="?page=hak-akses&&subpage=hak-akses-list"><input type="button" class="btn btn-danger"
              style="width:100px;" value="Cancel"></a>
        </td>
      </tr>
    </table>
  </form>
</body>

</html>