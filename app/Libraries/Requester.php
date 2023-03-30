<?php

namespace App\Libraries;

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

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

    public function setHeader(string $authHeader) {
        try {
            $this->kcUser  = $this->checkValidToken($authHeader);
            try {
                $this->buvUser = \App\Models\BUVDataModel::getDataByKCId($this->kcUser['sub']);
            } catch (\Throwable $th) {
                $this->buvUser = [];
            }
        } catch (\Throwable $th) {
            // TODO: 401!!
            throw $th;
        }    
    }

    protected function checkValidToken($header) {
        $cfg = Config('Keycloak');

        $pk = $cfg->publicKey;

        // extract the token from the header
        if(!empty($header)) {
            if (preg_match('/Bearer\s(\S+)/', $header, $matches)) {
                $token = $matches[1];
            }
        }
  
        // check if token is null or empty
        if(is_null($token) || empty($token)) {
            // 401!
            return null;
        }
  
        try {
            return (array) JWT::decode($token, new Key("-----BEGIN PUBLIC KEY-----\n$pk\n-----END PUBLIC KEY-----\n", 'RS256'));
        } catch (\Exception $ex) {
            // 401
            return null;
        }

        return null;
    
    }

    public function getUserInfo() {
        return [];
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