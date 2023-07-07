<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <title></title>
</head>

<body>
    <div class="container">
        <form action="javascript:void(0);" method="post" class="row mt-3">
            <div class="col-md-4">
                <input type="email" name="email_address" placeholder="Enter Mail" class="form-control" required>
            </div>
            <div class="col-md-4">
                <select name="user_role" class="form-control" required>
                    <option value="" disabled selected>Select User Role</option>
                    <option value="<?= TABLE_ADMINS ?>">Admin</option>
                    <option value="<?= TABLE_EMPLOYEES ?>">Employee</option>
                </select>
            </div>
            <div class="col-md-4">
                <button type="button" class="btn bnt-primary" name="search">Search</button>
                <button type="reset" class="btn bnt-primary" name="reset">Reset</button>
            </div>
        </form>
        <div class="row">
            <table class="table  mt-3">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">First</th>
                        <th scope="col">Last</th>
                        <th scope="col">Email</th>
                        <th scope="col">User Name</th>
                    </tr>
                </thead>
                <tbody id="userTable"></tbody>
            </table>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $(document).on('click', 'button[name="search"]', function() {
                userRoleId = $('select[name="user_role"]').val();
                userEmail = $('input[name="email_address"]').val();
                if (userRoleId !== '' && userEmail !== '') {
                    $.ajax({
                        url: "<?= base_url('Home/get_user_data') ?>",
                        method: "POST",
                        // dataType: "JSON",
                        data: {
                            'user_role': userRoleId,
                            'user_email': userEmail,
                        },
                        success: function(response) {
                            // console.log(response); return false;
                            response = JSON.parse(response);
                            if (response == 'Data Does Not Found') {
                                tabledata = '<tr>' +
                                    '<th scope="row">' + response + '</th>' +
                                    '</tr>'
                                $('#userTable').html(tabledata);
                            } else {
                                tabledata = '<tr>' +
                                    '<th scope="row">1</th>' +
                                    '<td>' + response.first_name + '</td>' +
                                    '<td>' + response.last_name + '</td>' +
                                    '<td>' + response.email + '</td>' +
                                    '<td>' + response.username + '</td>' +
                                    '</tr>'
                                $('#userTable').html(tabledata);
                            }
                        },
                    });
                } else {
                    alert('All Fields Required');
                }
            });
        });
    </script>
</body>

</html>