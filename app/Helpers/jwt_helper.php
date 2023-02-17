<?php
/*
 * Funciones de manejo de tokens JWT
*/

/**
 * Trae la clave publica de un servidor keycloak
 *
 * @return string
 */
function getPublicKey() {

    $cfg = Config('Keycloak');
    $kcURL = "$cfg->baseUri/realms/$cfg->realm/protocol/openid-connect/";

    $client = new GuzzleHttp\Client(['base_uri' => $kcURL]);

    $res = $client->request('GET', 'certs', [
        'allow_redirects' => false,
        'verify'          => false,
        'synchronous'     => true,
        'stream'          => true
    ]);

    //$rc = $res->getResultCode();

    $body = $res->getBody();

    $data = "";
    while (!$body->eof()) {
        $data .= $body->read(1024);
    }

    return $data;

}

/**
 * Devuelve los datos correspondientes a un JWT
 * Si el JWT es incorrecto, esta mal firmado devuelve null
 *
 * @param string $token
 * @return array
 */
function whoAmI ( $token )  {

    $cfg = Config('Keycloak');
    $kcURL = "$cfg->baseUri/realms/$cfg->realm/protocol/openid-connect/";

    $client = new GuzzleHttp\Client(['base_uri' => $kcURL]);

    $res = $client->request('GET', 'userinfo', [
        'allow_redirects' => false,
        'verify'          => false,
        'synchronous'     => true,
        'stream'          => true,
        'headers'         => [
            'Authorization' => $token
        ]
    ]);
    $body = $res->getBody();

    $data = "";
    while (!$body->eof()) {
        $data .= $body->read(1024);
    }

    return $data;
}