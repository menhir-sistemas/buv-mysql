<?php

namespace App\Controllers\Api;

class Buv extends BaseApiController
{
    protected $modelName = 'App\Models\BUVDataModel';

    /**
     * Override de la función de nuevo registro
     *
     * @return array
     */
    public function newRec() : array {
        return [
            '_id'               => 'VALOR DE EJEMPLO',
            'apellido'          => 'VALOR DE EJEMPLO',
            'celular'           => 'VALOR DE EJEMPLO',
            'coordenadas'       => 'VALOR DE EJEMPLO',
            'correoElectronico' => 'VALOR DE EJEMPLO',
            'deptounidad'       => 'VALOR DE EJEMPLO',
            'direccion'         => 'VALOR DE EJEMPLO',
            'fechaDeCreacion'   => 'VALOR DE EJEMPLO',
            'fechaDeNacimiento' => 'VALOR DE EJEMPLO',
            'fechaDefuncion'    => 'VALOR DE EJEMPLO',
            'fechaModificacion' => 'VALOR DE EJEMPLO',
            'genero'            => 'VALOR DE EJEMPLO',
            'nacionalidad'      => 'VALOR DE EJEMPLO',
            'nombre'            => 'VALOR DE EJEMPLO',
            'numeroDocumento'   => 'VALOR DE EJEMPLO',
            'piso'              => 'VALOR DE EJEMPLO',
            'plataforma'        => 'VALOR DE EJEMPLO',
            'secretaria'        => 'VALOR DE EJEMPLO',
            'sexo'              => 'VALOR DE EJEMPLO',
            'telefono'          => 'VALOR DE EJEMPLO',
            'telefonoLaboral'   => 'VALOR DE EJEMPLO',
            'tipoDeDocumento'   => 'VALOR DE EJEMPLO',
            'torre'             => 'VALOR DE EJEMPLO',
            'verificado'        => 'VALOR DE EJEMPLO',
        ];
    }
}