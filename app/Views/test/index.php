<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <title>Login/logout</title>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <div class="position-absolute top-0 start-0">
                <h2>Prueba de login/logout</h2>
                <button id="btnLogin" type="button" class="btn btn-success" onclick="login()" style="display: none">
                    Login
                </button>
                <button id="btnLogout" type="button" class="btn btn-danger" onclick="logout()" style="display: none">
                    Logout
                </button>
                <div class="row"  id="userDataDiv" style="display: none">
                <div class="col-6">
                        <div class="mb-3">
                            <label for="userData" class="form-label">Datos del usuario en Keycloak</label>
                            <textarea class="form-control" id="kcUserData" readonly></textarea>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="mb-3">
                            <label for="userBUVData" class="form-label">Datos del usuario en la BUV</label>
                            <textarea class="form-control" id="BUVUserData" readonly></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <script src="keycloak.js"></script>

    <script>
        var keycloak;

        function login() {
            keycloak.login();
        }

        function logout() {
            keycloak.logout();
        }

        function initKeycloak() {
            keycloak = new Keycloak({
                url: "https://ssotst.vicentelopez.gov.ar/",
                realm: "BUV",
                clientId: "dev-client",
                cors: true,
            });
            keycloak
                .init({
                    checkLoginIframe: false,
                    cors: true,
                })
                .then(function(authenticated) {
                    if (authenticated) {
                        $("#btnLogin").hide();
                        $("#btnLogout").show();
                        $("#userData").val("");
                        $("#userDataDiv").show();
                        $("#kcUserData").val(JSON.stringify(keycloak.tokenParsed, null, 4));
                        // Traigo la data de la BUV
                        $.ajax({
                            url        : '<?= base_url() ?>/api/buv/getUserInfo',
                            headers    : {
                                'Authorization' : `Bearer ${keycloak.token}`
                            }
                        })
                        .done(function(data){
                            $("#BUVUserData").val(JSON.stringify(data, null, 4));
                        })
                        .fail(function(xhr) {
                            debugger;
                        });
                    } else {
                        $("#btnLogin").show();
                        $("#btnLogout").hide();
                        $("#userDataDiv").hide();
                        $("#userData").val("");
                    }
                })
                .catch(function(error) {
                    console.log(error.error);
                });
        }

        $(document).ready(function() {
            initKeycloak();
        });
    </script>
</body>

</html>