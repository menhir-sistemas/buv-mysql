<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;

/**
 * Configuración de la interface con elasticsearch
 */
class ActiveDirectory extends BaseConfig
{
    /**
     * URL de la api de A/D
     *
     * @var string
     */
    public $adURL  = 'https://api-ad.vicentelopez.gov.ar';

    /**
     * Semilla de la firma digital del JWT
     *
     * @var string
     */
    public $adSeed  = 'wwwvicentelopezgovar';

    /**
     * Algoritmo de la firma digital del JWT
     *
     * @var string
     */
    public $adAlg  = 'HS256';

    /**
     * Grupo de operador
     *
     * @var string
     */
    public $adOpGroup  = 'APP-AMIDD-OP';

    /**
     * Grupo de admin
     *
     * @var string
     */
    public $adAdmGroup  = 'APP-AMIDD-ADM';

    /**
     * Issuer de A/D
     *
     * @var string
     */
    public $adIssuer  = 'A/D';

    /**
     * Audiencia de A/D
     *
     * @var string
     */
    public $adAud  = 'amidd';
    
}
