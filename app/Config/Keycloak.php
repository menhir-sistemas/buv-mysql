<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;

/**
 * Configuración de la interface con elasticsearch
 */
class Keycloak extends BaseConfig
{
    /**
     * El reino de keycloak
     * Por ahora, nos manejamos solo con el reino correspondiente a BUV
     *
     * @var string
     */
    public $realm = 'BUV';

    /**
     * El userid administrador del reino
     *
     * @var string
     */
    public $realmAdminName = '';

    /**
     * La password del administrador del reino
     *
     * @var string
     */
    public $realmAdminPass = '';

    /**
     * El cliente de admin
     *
     * @var string
     */
    public $adminClient ='';

    /**
     * La URI desde donde está todo el keycloak
     *
     * @var string
     */
    public $baseUri='';

    /**
     * OJO Con esto!!
     * La manera de evitar que el Guzzle de un error con https
     * es agregar el cacert.pem al php.ini
     *
     * @var boolean
     */
    public $verify = false;

    /**
     * Para el desarrollo no exige JWT (en breve desaparece)
     *
     * @var boolean
     */
    public $enforceJWT = true;
}
