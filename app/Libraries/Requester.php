<?php

namespace App\Libraries;

/**
 * Singleton para discriminar quien hace los requests
 * Toma el id del token que viene en el header Authorization
 * Si no, si no es necesaria la seguridad (util para el desarrollo), no da error
 */
class Requester {

    /**
     * El rol para chequear si es administrador del reino
     */
    private const REQ_REALM_ADMIN_ROLE = "realm-management";

    /**
     * El usuario en Keycloak
     *
     * @var array
     */
    private array $kcUser = [];

    /**
     * El usuario en la BUV (traido en base al id de keycloak)
     *
     * @var array
     */
    private array $buvUser;

    public function setHeader(string $authHeader){
        $this->checkValidToken($authHeader);

        try {
            // Elimino el bearer
            $realToken= str_ireplace('bearer ','',$authHeader);
            $this->kcUser = json_decode(base64_decode(str_replace('_', '/', str_replace('-','+',explode('.', $realToken)[1]))),true);
            $this->buvUser = \App\Models\BUVDataModel::getDataByKCId($this->kcUser['sub']);
        } catch (\Throwable $th) {
            throw $th;
        }
    
    }

    protected function checkValidToken($authHeader) {
        $cfg = Config('Keycloak');
        $kcURL = "$cfg->baseUri/realms/$cfg->realm/protocol/openid-connect/";
    
        $client = new \GuzzleHttp\Client(['base_uri' => $kcURL]);
    
        $res = $client->request('GET', 'userinfo', [
            'allow_redirects' => false,
            'verify'          => false,
            'synchronous'     => true,
            'stream'          => true,
            'headers'         => [
                'Authorization' => $authHeader
            ]
        ]);
        $body = $res->getBody();
    
        $data = "";
        while (!$body->eof()) {
            $data .= $body->read(1024);
        }
    
        // TODO: chequear retorno
    
    }

    public function getUserInfo() {
        return $this->buvUser;
    }

    /**
     * Chequea si el usuario logeado tiene el rol "realm-admin"
     *
     * @return boolean
     */
    public  function isRealmAdmin() {
        if ( !Config('Keycloak')->enforceJWT ) {
            return true;
        }

        try {
            $roles = $this->kcUser['resource_access']['account']['roles'];
            return in_array("realm-admin", $roles);
        } catch (\Throwable $th) {
            return false;
        }
    }
}