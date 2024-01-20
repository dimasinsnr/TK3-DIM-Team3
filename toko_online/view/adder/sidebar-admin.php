<div class="clm-2 np" style="height: 100%;">
  <div class="sidebar clm-2 np-x shadow" style="height: 100%; color:white; background-color:#4d48fc; position: fixed; width: 15%">
    <div class="clm-12 np" style="height: 100%; ">
      <h5 class="m-0" style="padding:15; padding-top:10px; width:100%; "><b>TOKO ONLINE</b></h5>
      <nav class="nav sidebar-nav nav-black" style="display:block">
        <ul class="np">
          <?php if ($_SESSION['id_akses'] == 2): ?>
            <?php
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'home' ? 'active' : '') . "'><a href='?page=home&&subpage=dashboard'><i class='fa-solid fa-chart-line'></i> Dashboard</a> </li>";
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'hak-akses' ? 'active' : '') . "'><a href='?page=hak-akses&subpage=hak-akses-list'><i class='fa-solid fa-key'></i> Hak Akses</a></li>";
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'pengguna' ? 'active' : '') . "'><a href='?page=pengguna&subpage=pengguna-list'><i class='fa-solid fa-user'></i> Pengguna</a></li>";
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'barang' ? 'active' : '') . "'><a href='?page=barang&subpage=barang-list'><i class='fa-solid fa-box'></i> Barang</a></li>";
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'penjualan' ? 'active' : '') . "'><a href='?page=penjualan&subpage=penjualan-list'><i class='fa-solid fa-bag-shopping'></i> Penjualan</a></li>";
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'pembelian' ? 'active' : '') . "'><a href='?page=pembelian&subpage=pembelian-list'><i class='fa-solid fa-bag-shopping'></i> Pembelian</a></li>";
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'supplier' ? 'active' : '') . "'><a href='?page=supplier&subpage=supplier-list'><i class='fa-solid fa-user'></i> Supplier</a></li>";
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'customer' ? 'active' : '') . "'><a href='?page=customer&subpage=customer-list'><i class='fa-solid fa-user'></i> Customer</a></li>";
            ?>
          <?php elseif ($_SESSION['id_akses'] == 4): ?>
            <?php
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'home' ? 'active' : '') . "'><a href='?page=home&&subpage=dashboard'><i class='fa-solid fa-chart-line'></i> Dashboard</a> </li>";
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'pembelian' ? 'active' : '') . "'><a href='?page=pembelian&subpage=pembelian-list'><i class='fa-solid fa-bag-shopping'></i> Pembelian</a></li>";
            ?>
          <?php elseif ($_SESSION['id_akses'] == 5): ?>
            <?php
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'home' ? 'active' : '') . "'><a href='?page=home&&subpage=dashboard'><i class='fa-solid fa-chart-line'></i> Dashboard</a> </li>";
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'penjualan' ? 'active' : '') . "'><a href='?page=penjualan&subpage=penjualan-list'><i class='fa-solid fa-bag-shopping'></i> Penjualan</a></li>";
            ?>
          <?php elseif ($_SESSION['id_akses'] == 6): ?>
            <?php
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'home' ? 'active' : '') . "'><a href='?page=home&&subpage=dashboard'><i class='fa-solid fa-chart-line'></i> Dashboard</a> </li>";
            echo "<li class='" . (isset($_GET['page']) && $_GET['page'] == 'barang' ? 'active' : '') . "'><a href='?page=barang&subpage=barang-list'><i class='fa-solid fa-box'></i> Barang</a></li>";
            ?>
          <?php endif; ?>
          <hr>
          <li class=""><a href="?logout=true"><i class='fas fa-sign-out-alt'></i> Log out</a></li>
        </ul>
      </nav>
    </div>
    <div class="clm-12 np">

    </div>
  </div>
</div>