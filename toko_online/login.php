<?php
session_start();
include('koneksi.php');

// Fungsi untuk memeriksa login
function isUserLoggedIn() {
    return isset($_SESSION['user_id']);
}

// Fungsi untuk melakukan login
function login($username, $password, $connect) {
    $safeUsername = mysqli_real_escape_string($connect, $username);
    $safePassword = mysqli_real_escape_string($connect, $password);

    // Query untuk mendapatkan informasi pengguna berdasarkan username
    $query = "SELECT * FROM pengguna WHERE nama_pengguna = '$safeUsername'";
    $result = mysqli_query($connect, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        // Verifikasi password dengan password yang di-hash di database
        if ($safePassword == $row['password']) {
            $_SESSION['user_id'] = $row['id_pengguna'];
            $_SESSION['id_akses'] = $row['id_akses'];
            return true;
        }
    }

    return false;
}

// Fungsi untuk melakukan logout
function logout() {
    unset($_SESSION['user_id']);
    unset($_SESSION['id_akses']);
    session_destroy();
}

// Jika formulir login disubmit
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Memeriksa kredensial
    if (login($username, $password, $connect)) {
        // Jika login berhasil, arahkan ke halaman beranda atau halaman lainnya
        header("location:admin.php?page=home&&subpage=dashboard");
        // header('Location: home.php');
        exit;
    } else {
        // Jika login gagal, tampilkan pesan kesalahan atau arahkan ke halaman login kembali
        $error = "Username atau password salah.";
    }
}
?>

<html>

<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
      body{
        margin: 0;
        padding: 0;
        font-family: sans-serif;
        background: #34495e;
      }
      .box{
        width: 400px;
        padding: 40px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        background: #191919;
        text-align: center;
      }
      .box{
        color: white;
        text-transform: uppercase;
        font-weight: 500;
      }
      .box input[type = "text"],.box input[type = "password"]{
        border:0;
        background: none;
        display: block;
        margin: 20px auto;
        text-align: center;
        border: 2px solid #3498db;
        padding: 14px 10px;
        width: 200px;
        outline: none;
        color: white;
        border-radius: 24px;
        transition: 0.25s;
      }
      .box input[type = "text"]:focus,.box input[type = "password"]:focus{
        width: 280px;
        border-color: #2ecc71;
      }
      .box input[type = "submit"]{
        border:0;
        background: none;
        display: block;
        margin: 20px auto;
        text-align: cesnter;
        border: 2px solid #2ecc71;
        padding: 14px 40px;
        outline: none;
        color: white;
        border-radius: 24px;
        transition: 0.25s;
        cursor: pointer;
      }
      .box input[type = "submit"]:hover{
        background: #2ecc71;
      }
    </style>
</head>

<body>
  <?php if (!isUserLoggedIn()): ?>
    <form class="box" action="" method="post">
      <h1>LOGIN</h1>
      <input type="text" name="username" placeholder="Username">
      <input type="password" name="password" placeholder="Password">
      <input type="submit" name="">
      <?php if (isset($error)): ?>
          <p><?php echo $error; ?></p>
      <?php endif; ?>
    </form>
  <?php else: ?>
    <?php header("location:admin.php?page=home&&subpage=dashboard"); ?>
  <?php endif; ?>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js"
  integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw=="
  crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</html>