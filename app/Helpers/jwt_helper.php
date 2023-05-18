<?php
/*
 * Funciones de manejo de tokens JWT
*/

/**
 * Devuelve los datos correspondientes a un JWT
 * Si el JWT es incorrecto o esta mal firmado devuelve null
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

    // TODO: chequear retorno

    // Elimino el bearer
    try {
        $realToken= str_ireplace('bearer ','',$token);
        return json_decode(base64_decode(str_replace('_', '/', str_replace('-','+',explode('.', $realToken)[1]))));
    } catch (\Throwable $th) {
        throw $th;
    }
}