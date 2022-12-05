<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;

/**
 * Configuración de la interface con elasticsearch
 */
class BUV extends BaseConfig
{
    /**
     * Protocolo de conexión a elasticsearch
     *
     * @var string
     */
    public $elasticSearchProt  = 'https';

    /**
     * Host del servidor de elasticsearch
     *
     * @var string
     */
    public $elasticSearchHost = 'localhost';

    /**
     * Host del servidor de elasticsearch
     *
     * @var string
     */
    public $elasticSearchPort = 9200;

    /**
     * Usuario para conectarse a elasticsearch
     *
     * @var string
     */
    public $elasticSearchUser = 'elastic';


    /**
     * Password para conectarse a elasticsearch
     *
     * @var string
     */
    public $elasticSearchPass = '';

    /**
     * Nombre del índice donde están los datos
     *
     * @var string
     */
    public $elasticSearchIndex = '';

    /**
     * Tamaño de la página de lectura
     *
     * @var integer
     */
    public $elasticSearchPage  = 1000;
    
}
