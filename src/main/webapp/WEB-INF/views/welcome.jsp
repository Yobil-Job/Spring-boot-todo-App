<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to TaskFlow</title>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #6c5ce7;
            --secondary: #a29bfe;
            --accent: #fd79a8;
            --light: #f8f9fa;
            --dark: #343a40;
            --nav-gradient: linear-gradient(135deg, #4b6cb7 0%, #182848 100%);
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            color: var(--dark);
        }
        
        /* Navbar styles */
        .bg-gradient {
            background: var(--nav-gradient) !important;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        
        .navbar {
            padding: 0.8rem 1rem;
            transition: all 0.3s ease;
        }
        
        .navbar-brand {
            font-size: 1.5rem;
            transition: all 0.3s ease;
        }
        
        .logo-icon {
            display: inline-flex;
            align-items: center;
            transition: transform 0.3s ease;
        }
        
        .navbar-brand:hover .logo-icon {
            transform: rotate(15deg);
        }
        
        .nav-link {
            padding: 0.5rem 1rem;
            margin: 0 0.25rem;
            border-radius: 4px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
        }
        
        .nav-icon {
            margin-right: 8px;
            font-size: 0.9rem;
        }
        
        .hover-underline {
            position: relative;
        }
        
        .hover-underline:after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: #fff;
            transition: width 0.3s ease;
        }
        
        .hover-underline:hover:after {
            width: 100%;
        }
        
        .btn-logout {
            background-color: rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }
        
        .btn-logout:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
        }
        
        .logout-icon {
            margin-right: 8px;
            transition: transform 0.3s ease;
        }
        
        .btn-logout:hover .logout-icon {
            transform: translateX(3px);
        }
        
        /* Main content styles */
        .main-content {
            padding-top: 80px;
            padding-bottom: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 80px);
        }
        
        .welcome-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 90%;
            max-width: 600px;
            text-align: center;
            animation: fadeIn 0.8s ease-out;
            margin: 20px auto;
        }
        
        h1 {
            color: var(--primary);
            margin-bottom: 30px;
            font-size: 2.5rem;
            position: relative;
            display: inline-block;
        }
        
        h1:after {
            content: '';
            position: absolute;
            width: 60%;
            height: 4px;
            background: var(--accent);
            bottom: -10px;
            left: 20%;
            border-radius: 2px;
        }
        
        .welcome-message {
            font-size: 1.2rem;
            margin-bottom: 40px;
            line-height: 1.6;
        }
        
        .cta-button {
            display: inline-block;
            background: var(--primary);
            color: white;
            padding: 15px 30px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(108, 92, 231, 0.3);
            position: relative;
            overflow: hidden;
            border: none;
        }
        
        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(108, 92, 231, 0.4);
            color: white;
        }
        
        .cta-button:active {
            transform: translateY(1px);
        }
        
        .illustration {
            margin: 30px 0;
            height: 150px;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%236c5ce7"><path d="M19 3h-4.18C14.4 1.84 13.3 1 12 1c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm2 14H7v-2h7v2zm3-4H7v-2h10v2zm0-4H7V7h10v2z"/></svg>');
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            opacity: 0.8;
        }
        
        .features {
            display: flex;
            justify-content: space-around;
            margin: 30px 0;
            flex-wrap: wrap;
        }
        
        .feature {
            flex: 1;
            min-width: 120px;
            margin: 10px;
            padding: 15px;
            background: rgba(108, 92, 231, 0.1);
            border-radius: 10px;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        @media (max-width: 991.98px) {
            .navbar-collapse {
                padding: 1rem 0;
            }
            
            .nav-link {
                margin: 0.25rem 0;
                padding: 0.75rem 1rem;
            }
            
            .btn-logout {
                margin-top: 0.5rem;
            }
        }
        
        @media (max-width: 600px) {
            .welcome-container {
                padding: 30px 20px;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            .main-content {
                padding-top: 70px;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-gradient fixed-top">
      <div class="container">
        <!-- Animated logo with icon -->
        <a class="navbar-brand d-flex align-items-center" href="/">
          <span class="logo-icon mr-2">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M9 5H7V7H9V5Z" fill="currentColor"/>
              <path d="M9 9H7V11H9V9Z" fill="currentColor"/>
              <path d="M11 5H13V7H11V5Z" fill="currentColor"/>
              <path d="M13 9H11V11H13V9Z" fill="currentColor"/>
              <path d="M9 13H7V15H9V13Z" fill="currentColor"/>
              <path d="M11 13H13V15H11V13Z" fill="currentColor"/>
              <path fill-rule="evenodd" clip-rule="evenodd" d="M3 3H21V21H3V3ZM5 5V19H19V5H5Z" fill="currentColor"/>
            </svg>
          </span>
          <span class="logo-text font-weight-bold">TaskFlow</span>
        </a>
        
        <!-- Animated hamburger menu -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
          <!-- Left-aligned menu items -->
          <ul class="navbar-nav me-auto">
            <li class="nav-item active">
              <a class="nav-link hover-underline" href="/">
                <span class="nav-icon"><i class="fas fa-home"></i></span>
                <span class="nav-text">Home</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link hover-underline" href="/manage-todo">
                <span class="nav-icon"><i class="fas fa-tasks"></i></span>
                <span class="nav-text">My Tasks</span>
              </a>
            </li>
          </ul>
          
          <!-- Right-aligned logout button -->
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link btn-logout" href="/logout">
                <span class="logout-icon"><i class="fas fa-sign-out-alt"></i></span>
                <span class="logout-text">Logout</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="welcome-container">
            <div class="illustration"></div>
            <h1>Welcome Back, ${name}!</h1>
            <p class="welcome-message">
                Your organized life starts here. Manage your tasks efficiently and stay productive with our simple yet powerful todo application.
            </p>
            
            <div class="features">
                <div class="feature">
                    <strong>Simple</strong>
                    <p>Easy to use</p>
                </div>
                <div class="feature">
                    <strong> Fast</strong>
                    <p>Quick access</p>
                </div>
                <div class="feature">
                    <strong>Reliable</strong>
                    <p>Always available</p>
                </div>
            </div>
            
            <a href="/manage-todo" class="cta-button">Manage Your Todos</a>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>