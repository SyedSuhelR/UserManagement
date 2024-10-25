<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Footer Example</title>
    <style>
     
        .container-fluid {
            background-color: #283593; /* Background color */
            color: white; /* Text color */
            text-align: center;
            padding: 10px;
            margin-top: 20px;
            margin-bottom:0;
        }
        table {
            width: 100%;
            border-collapse: collapse; /* Collapse borders to remove gaps */
        }
        th, td {
            background-color: transparent; /* No background color for cells */
            color: white; /* Text color for cells */
            border: none; /* Remove cell borders */
        }
        footer {
            margin-top: 20px; /* Add margin to separate from content above */
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <footer>
        <table>
            <thead>
                <tr>
                    <th>Company</th>
                    <th>Products</th>
                    <th>Brand</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Tech Mahindra</td>
                    <td>Clothing</td>
                    <td>Dior</td>
                    <td><i class="fa-solid fa-house-user"></i> New York, 10012</td>
                </tr>
                <tr>
                    <td>Goode</td>
                    <td>Home Appliances</td>
                    <td>Gucci</td>
                    <td><i class="fa-solid fa-envelope"></i> info@gmail.com</td>
                </tr>
                <tr>
                    <td>Revature</td>
                    <td>Electronics</td>
                    <td>Hermes</td>
                    <td><i class="fa-solid fa-phone"></i> +(91)-123-456-7890</td>
                </tr>
                <tr>
                    <td>TCS</td>
                    <td>Sports & Books</td>
                    <td>Allen Solly</td>
                    <td><i class="fa-solid fa-fax"></i> +91-098765</td>
                </tr>
                <tr>
                    <td>Zugii</td>
                    <td colspan="3">Additional Information</td>
                </tr>
            </tbody>
        </table>
    </footer>
</div>
</body>
</html>
