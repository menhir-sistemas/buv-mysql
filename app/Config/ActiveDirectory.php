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
    
}
