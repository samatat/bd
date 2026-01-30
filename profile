<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Samatat | Organization</title>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">

  <style>
    :root {
      --primary: #0b2c4a;
      --secondary: #c8a24a;
      --light: #ffffff;
      --gray: #f4f6f8;
      --text: #222;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      font-family: 'Inter', sans-serif;
      color: var(--text);
      line-height: 1.6;
    }

    h1, h2, h3 {
      font-family: 'Playfair Display', serif;
      color: var(--primary);
    }

    header {
      background: var(--primary);
      color: var(--light);
      padding: 15px 8%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    header img { height: 50px; }

    nav a {
      margin-left: 25px;
      font-weight: 500;
      color: var(--light);
    }

    nav a:hover { color: var(--secondary); }

    .hero {
      background: linear-gradient(rgba(11,44,74,.85), rgba(11,44,74,.85)), url('hero.jpg');
      background-size: cover;
      background-position: center;
      padding: 120px 8%;
      color: white;
    }

    .hero h1 { font-size: 48px; color: white; }
    .hero p { max-width: 600px; margin-top: 15px; }

    .btn {
      display: inline-block;
      margin-top: 25px;
      padding: 12px 30px;
      background: var(--secondary);
      color: var(--primary);
      font-weight: 600;
      border-radius: 30px;
    }

    section { padding: 80px 8%; }
    .section-gray { background: var(--gray); }

    footer {
      background: var(--primary);
      color: white;
      text-align: center;
      padding: 30px 8%;
    }

    /* Login page */
    .login-box {
      max-width: 400px;
      margin: 100px auto;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0,0,0,.08);
      background: white;
    }

    .login-box input {
      width: 100%;
      padding: 12px;
      margin-bottom: 15px;
      border-radius: 6px;
      border: 1px solid #ccc;
    }

    .login-box button {
      width: 100%;
      padding: 12px;
      border: none;
      background: var(--primary);
      color: white;
      font-weight: 600;
      border-radius: 6px;
      cursor: pointer;
    }
  </style>
</head>
<body>

<header>
  <img src="logo.png" alt="Samatat Logo">
  <nav>
    <a href="index.html">Home</a>
    <a href="login.php">Admin Login</a>
  </nav>
</header>

<div class="hero">
  <h1>Samatat</h1>
  <p>A value-driven organization committed to sustainable development and institutional growth.</p>
</div>

<section>
  <h2>About Samatat</h2>
  <p>Samatat is an organization established to foster ethical leadership, development initiatives, and long-term growth.</p>
</section>

<footer>
  <p>&copy; 2026 Samatat. All Rights Reserved.</p>
</footer>

</body>
</html>


<!-- ===================== -->
<!-- SAVE THIS AS login.php -->
<!-- ===================== -->
<?php
session_start();

$admin_user = 'admin';
$admin_pass = 'samatat123';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if ($_POST['username'] === $admin_user && $_POST['password'] === $admin_pass) {
        $_SESSION['admin'] = true;
        header('Location: dashboard.php');
        exit();
    } else {
        $error = 'Invalid login';
    }
}
?>

<!DOCTYPE html>
<html>
<head><title>Admin Login</title></head>
<body>
  <div class="login-box">
    <h2>Admin Login</h2>
    <?php if(isset($error)) echo "<p style='color:red'>$error</p>"; ?>
    <form method="post">
      <input type="text" name="username" placeholder="Username" required>
      <input type="password" name="password" placeholder="Password" required>
      <button type="submit">Login</button>
    </form>
  </div>
</body>
</html>


<!-- ========================= -->
<!-- SAVE THIS AS dashboard.php -->
<!-- ========================= -->
<?php
session_start();
if (!isset($_SESSION['admin'])) {
  header('Location: login.php');
  exit();
}
?>

<!DOCTYPE html>
<html>
<head><title>Admin Dashboard</title></head>
<body>
  <h2>Welcome Admin</h2>
  <p>This is your private dashboard.</p>
  <a href="logout.php">Logout</a>
</body>
</html>


<!-- ======================= -->
<!-- SAVE THIS AS logout.php -->
<!-- ======================= -->
<?php
session_start();
session_destroy();
header('Location: login.php');
exit();
?>
