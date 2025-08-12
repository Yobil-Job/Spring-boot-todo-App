<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Your Todos | TaskFlow</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #6c5ce7;
            --secondary: #a29bfe;
            --accent: #fd79a8;
            --light: #f8f9fa;
            --dark: #343a40;
            --nav-gradient: linear-gradient(135deg, #4b6cb7 0%, #182848 100%);
            --success: #00b894;
            --warning: #fdcb6e;
            --danger: #d63031;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            color: var(--dark);
            padding-top: 80px;
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
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }
        
        .page-title {
            color: var(--primary);
            font-weight: 600;
            position: relative;
        }
        
        .page-title:after {
            content: '';
            position: absolute;
            width: 50px;
            height: 4px;
            background: var(--accent);
            bottom: -10px;
            left: 0;
            border-radius: 2px;
        }
        
        .add-todo-btn {
            background: var(--primary);
            color: white;
            padding: 10px 20px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
        }
        
        .add-todo-btn:hover {
            background: var(--secondary);
            transform: translateY(-2px);
            color: white;
            box-shadow: 0 5px 15px rgba(108, 92, 231, 0.4);
        }
        
        .add-todo-btn i {
            margin-right: 8px;
        }
        
        /* Todo table styles */
        .todo-table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .todo-table thead {
            background: var(--primary);
            color: white;
        }
        
        .todo-table th {
            font-weight: 500;
            padding: 15px;
        }
        
        .todo-table td {
            padding: 12px 15px;
            vertical-align: middle;
        }
        
        .todo-table tr:nth-child(even) {
            background-color: rgba(108, 92, 231, 0.05);
        }
        
        .todo-table tr:hover {
            background-color: rgba(108, 92, 231, 0.1);
        }
        
        .status-badge {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        
        .status-done {
            background: rgba(0, 184, 148, 0.1);
            color: var(--success);
        }
        
        .status-pending {
            background: rgba(253, 203, 110, 0.1);
            color: #e17055;
        }
        
        .priority-high {
            color: var(--danger);
            font-weight: 600;
        }
        
        .priority-medium {
            color: #e17055;
            font-weight: 500;
        }
        
        .priority-low {
            color: #00b894;
        }
        
        .action-btn {
            border: none;
            border-radius: 5px;
            padding: 6px 12px;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
        }
        
        .edit-btn {
            background: rgba(108, 92, 231, 0.1);
            color: var(--primary);
        }
        
        .edit-btn:hover {
            background: rgba(108, 92, 231, 0.2);
            color: var(--primary);
        }
        
        .delete-btn {
            background: rgba(214, 48, 49, 0.1);
            color: var(--danger);
        }
        
        .delete-btn:hover {
            background: rgba(214, 48, 49, 0.2);
            color: var(--danger);
        }
        
        .action-btn i {
            margin-right: 5px;
        }
        
        .empty-state {
            text-align: center;
            padding: 50px 20px;
            color: #636e72;
        }
        
        .empty-state i {
            font-size: 3rem;
            color: #b2bec3;
            margin-bottom: 20px;
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
            
            .todo-table {
                display: block;
                overflow-x: auto;
            }
        }
        
        @media (max-width: 768px) {
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .add-todo-btn {
                margin-top: 15px;
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
            <li class="nav-item">
              <a class="nav-link hover-underline" href="/">
                <span class="nav-icon"><i class="fas fa-home"></i></span>
                <span class="nav-text">Home</span>
              </a>
            </li>
            <li class="nav-item active">
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
    <div class="main-container">
        <div class="page-header">
            <h1 class="page-title">Manage Your Todos</h1>
            <a href="/add-todo" class="add-todo-btn">
                <i class="fas fa-plus"></i> Add New Todo
            </a>
        </div>
        
        <c:choose>
            <c:when test="${empty todoes}">
                <div class="empty-state">
                    <i class="fas fa-clipboard-list"></i>
                    <h3>No Todos Found</h3>
                    <p>You don't have any todos yet. Start by adding a new one!</p>
                    <a href="/add-todo" class="add-todo-btn mt-3">
                        <i class="fas fa-plus"></i> Create Your First Todo
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive todo-table">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Description</th>
                                <th>Due Date</th>
                                <th>Priority</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="todo" items="${todoes}">
                                <tr>
                                    <td>${todo.description}</td>
                                    <td>${todo.targetDate}</td>
                                    <td class="priority-${todo.priority.toLowerCase()}">
                                        ${todo.priority}
                                    </td>
                                    <td>
                                        <span class="status-badge ${todo.done ? 'status-done' : 'status-pending'}">
                                            ${todo.done ? 'Completed' : 'Pending'}
                                        </span>
                                    </td>
                                    <td>
                                        <a href="/update?id=${todo.id}" class="action-btn edit-btn me-2">
                                            <i class="fas fa-edit"></i> Edit
                                        </a>
                                        <a href="/delete?id=${todo.id}" class="action-btn delete-btn">
                                            <i class="fas fa-trash-alt"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add active class to current nav item
        document.addEventListener('DOMContentLoaded', function() {
            const currentPage = location.pathname;
            document.querySelectorAll('.nav-link').forEach(link => {
                if (link.getAttribute('href') === currentPage) {
                    link.classList.add('active');
                }
            });
        });
    </script>
</body>
</html>