<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add New Todo | TaskFlow</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Bootstrap Datepicker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/css/bootstrap-datepicker.min.css">
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
        .form-container {
            max-width: 700px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .form-title {
            color: var(--primary);
            font-weight: 600;
            position: relative;
            display: inline-block;
        }
        
        .form-title:after {
            content: '';
            position: absolute;
            width: 50px;
            height: 4px;
            background: var(--accent);
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
        }
        
        .form-control {
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.25rem rgba(108, 92, 231, 0.25);
        }
        
        .form-select {
            padding: 12px 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }
        
        .form-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.25rem rgba(108, 92, 231, 0.25);
        }
        
        .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 8px;
        }
        
        .radio-option {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .radio-option input[type="radio"] {
            width: 18px;
            height: 18px;
            accent-color: var(--primary);
        }
        
        .btn-submit {
            background: var(--primary);
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            border: none;
            font-weight: 500;
            transition: all 0.3s ease;
            width: 100%;
            margin-top: 10px;
        }
        
        .btn-submit:hover {
            background: var(--secondary);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(108, 92, 231, 0.4);
        }
        
        .btn-cancel {
            background: white;
            color: var(--dark);
            padding: 12px 25px;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-weight: 500;
            transition: all 0.3s ease;
            width: 100%;
            text-align: center;
            text-decoration: none;
            display: block;
            margin-top: 15px;
        }
        
        .btn-cancel:hover {
            background: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .text-warning {
            color: var(--danger) !important;
            font-size: 0.85rem;
            margin-top: 5px;
            display: block;
        }
        
        .datepicker {
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .datepicker table tr td.active, 
        .datepicker table tr td.active:hover {
            background-color: var(--primary);
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
        
        @media (max-width: 768px) {
            .form-container {
                padding: 20px;
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
    <div class="container py-5">
        <div class="form-container">
            <div class="form-header">
                <h1 class="form-title">Add New Todo</h1>
            </div>
            
            <form:form method="post" modelAttribute="todo">
                <div class="form-group">
                    <form:label path="description" class="form-label">Description</form:label>
                    <form:input type="text" path="description" class="form-control" required="required" placeholder="Enter task description"/>
                    <form:errors path="description" cssClass="text-warning"/>
                </div>
                
                <div class="form-group">
                    <form:label path="targetDate" class="form-label">Target Date</form:label>
                    <div class="input-group">
                        <form:input type="text" path="targetDate" id="targetDate" class="form-control" required="required" placeholder="Select date"/>
                        <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                    </div>
                    <form:errors path="targetDate" cssClass="text-warning"/>
                </div>
                
                <form:input type="hidden" path="userName" id="userName" required="required"/>
                <form:errors path="userName" cssClass="text-warning"/>
                
                <div class="form-group">
                    <form:label path="priority" class="form-label">Priority</form:label>
                    <form:select path="priority" id="priority" class="form-select" required="required">
                        <form:option value="">Select Priority</form:option>
                        <form:option value="LOW">Low</form:option>
                        <form:option value="MEDIUM">Medium</form:option>
                        <form:option value="HIGH">High</form:option>
                    </form:select>
                    <form:errors path="priority" cssClass="text-warning"/>
                </div>
                
                <div class="form-group">
                    <form:label path="done" class="form-label">Completed</form:label>
                    <div class="radio-group">
                        <div class="radio-option">
                            <form:radiobutton path="done" value="true" id="doneYes"/>
                            <label for="doneYes">Yes</label>
                        </div>
                        <div class="radio-option">
                            <form:radiobutton path="done" value="false" id="doneNo"/>
                            <label for="doneNo">No</label>
                        </div>
                    </div>
                    <form:errors path="done" cssClass="text-warning"/>
                </div>
                
                <form:input type="hidden" path="id" required="required"/>
                
                <button type="submit" class="btn-submit">
                    <i class="fas fa-save me-2"></i> Save Todo
                </button>
                
                <a href="/manage-todo" class="btn-cancel">
                    <i class="fas fa-times me-2"></i> Cancel
                </a>
            </form:form>
        </div>
    </div>

    <!-- jQuery, Bootstrap JS Bundle with Popper, and Datepicker -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/js/bootstrap-datepicker.min.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
            $('#targetDate').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true,
                todayHighlight: true
            });
            
            // Add active class to current nav item
            const currentPage = location.pathname;
            $('.nav-link').each(function() {
                if ($(this).attr('href') === currentPage) {
                    $(this).addClass('active');
                }
            });
        });
    </script>
</body>
</html>