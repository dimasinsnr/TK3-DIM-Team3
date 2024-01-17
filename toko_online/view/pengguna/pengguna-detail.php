<?php
require_once "controller/pengguna_controller.php";
require_once "controller/hak_akses_controller.php";

$penggunaController = new PenggunaController();
$penggunaController->callasset();

$penggunaDetail = null;
if (isset($_GET['id'])) {
  $penggunaDetail = $penggunaController->pengguna_detail($_GET['id']);
}


$hakAksesController = new HakAksesController();
$hakAksesList = $hakAksesController->hak_akses_list();
?>
<html>

<head>
</head>

<body>
  <div class="clm-12" style="margin-top: 10px;">
    <h1>
      <?php echo $penggunaDetail != null ? "Edit Pengguna" : "Tambah Pengguna" ?>
    </h1>
  </div>
  <form action="submit.php" method="post" enctype="multipart/form-data">
    <?php if ($penggunaDetail): ?>
      <input type="hidden" name="id_pengguna" value="<?php echo $penggunaDetail[0]['id_pengguna'] ?>">
    <?php endif ?>
    <table class="table">
      <tr>
        <td style="text-align: left; border-top: none"><b>Nama Pengguna : </b></td>
        <td style="border-top: none"><input type="text" class="input" name="nama_pengguna"
            value="<?php echo $penggunaDetail != null ? $penggunaDetail[0]['nama_pengguna'] : '' ?>" autocomplete="off"
            required /></td>
      </tr>
      <tr>
        <td style="text-align: left;"><b>Password :</b></td>
        <td><input type="text" class="input" name="password"
            value="<?php echo $penggunaDetail != null ? $penggunaDetail[0]['password'] : '' ?>" autocomplete="off"
            required /></td>
      </tr>
      <tr>
        <td style="text-align: left;"><b>Hak Akses :</b></td>
        <td>
          <select name="id_akses" class="input" required>
            <?php foreach ($hakAksesList as $hakAkses): ?>
              <option value="<?php echo $hakAkses['id_akses']; ?>" <?php if ($penggunaDetail != null && $hakAkses['id_akses'] == $penggunaDetail[0]['id_akses']) {
                   echo "selected";
                 } ?>><?php echo $hakAkses['nama_akses']; ?>
              </option>
            <?php endforeach ?>
          </select>
        </td>
      </tr>
      <tr>
        <td style="text-align: left;"><b>Nama Depan : </b></td>
        <td><input type="text" class="input" name="nama_depan"
            value="<?php echo $penggunaDetail != null ? $penggunaDetail[0]['nama_depan'] : '' ?>" autocomplete="off"
            required /></td>
      </tr>
      <tr>
        <td style="text-align: left;"><b>Nama Belakang : </b></td>
        <td><input type="text" class="input" name="nama_belakang"
            value="<?php echo $penggunaDetail != null ? $penggunaDetail[0]['nama_belakang'] : '' ?>" autocomplete="off"
            required /></td>
      </tr>
      <tr>
        <td style="text-align: left;"><b>No HP : </b></td>
        <td><input type="tel" pattern="[0-9]*" class="input" name="no_hp"
            value="<?php echo $penggunaDetail != null ? $penggunaDetail[0]['no_hp'] : '' ?>" autocomplete="off"
            required /></td>
      </tr>
      <tr>
        <td style="text-align: left;"><b>Alamat : </b></td>
        <td>
          <textarea class="input" name="alamat" autocomplete="off"
            required><?php echo $penggunaDetail != null ? $penggunaDetail[0]['alamat'] : '' ?> </textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:right">
          <?php if ($penggunaDetail): ?>
            <input type="submit" name="pengguna-edit-submit" class="btn btn-success" style="width:100px;" value="Edit">
          <?php endif ?>
          <?php if ($penggunaDetail == null): ?>
            <input type="submit" name="pengguna-add-submit" class="btn btn-success" style="width:100px;" value="Add">
          <?php endif ?>
          <a href="?page=pengguna&&subpage=pengguna-list"><input type="button" class="btn btn-danger"
              style="width:100px;" value="Cancel"></a>
        </td>
      </tr>
    </table>
  </form>
</body>

</html>