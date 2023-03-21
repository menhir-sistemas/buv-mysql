<?php

namespace App\Libraries;

/**
 * Singleton para discriminar quien hace los requests
 * Toma el id del token que viene en el header Authorization
 * Si no, si no es necesaria la seguridad (util para el desarrollo), no da error
 */
class Requester {

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
            try {
                $this->buvUser = \App\Models\BUVDataModel::getDataByKCId($this->kcUser['sub']);
            } catch (\Throwable $th) {
                $this->buvUser = [];
            }
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
        if ( !$this->buvUser == null )
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
            $roles = $this->kcUser['resource_access']['realm-management']['roles'];
            return in_array("realm-admin", $roles);
        } catch (\Throwable $th) {
            return false;
        }
    }

    /**
     * Controla si un usuario tiene un determinado rol
     *
     * @param string $role
     * @return boolean
     */
    private function hasRole($role) {
        if ( !Config('Keycloak')->enforceJWT ) {
            return true;
        }

        try {
            $roles = $this->kcUser['realm_access']['roles'];
            return in_array($role, $roles);
        } catch (\Throwable $th) {
            return false;
        }

    }

    /**
     * Chequea si el usuario logeado tiene el rol "buv-get"
     *
     * @return boolean
     */
    public function canGet() {
        return $this->hasRole("buv-get");
    }
    /**
     * Chequea si el usuario logeado tiene el rol "buv-post"
     *
     * @return boolean
     */
    public function canPost() {
        return $this->hasRole("buv-post");
    }
    /**
     * Chequea si el usuario logeado tiene el rol "buv-put"
     *
     * @return boolean
     */
    public function canPut() {
        return $this->hasRole("buv-put");
    }
    /**
     * Chequea si el usuario logeado tiene el rol "buv-delete"
     *
     * @return boolean
     */
    public function canDelete() {
        return $this->hasRole("buv-delete");
    }
}