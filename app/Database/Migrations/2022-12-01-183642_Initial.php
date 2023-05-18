<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Initial extends Migration
{
    public function up()
    {

        $this
            ->forge
            ->addField([
                'id'          => ['type' =>  'INT', 'auto_increment' => true],
                '_id'         => ['type' =>  'text', 'null' => false],
                'msg'         => ['type' =>  'text', 'null' => false],
                'created_at'  => ['type' =>  'datetime', 'null' => false]
            ]);

        $this
            ->forge
            ->addKey('id', true);

        $this
            ->forge
            ->createTable('load_data_errors');           

        $this
            ->forge
            ->addField([
                'id'                => ['type' => 'INT', 'auto_increment' => true],
                '_id'               => ['type' =>  'text', 'null' => false],
                'apellido'          => ['type' =>  'text', 'null' => true],
                'celular'           => ['type' =>  'text', 'null' => true],
                'coordenadas'       => ['type' =>  'text', 'null' => true],
                'correoElectronico' => ['type' =>  'text', 'null' => true],
                'deptounidad'       => ['type' =>  'text', 'null' => true],
                'direccion'         => ['type' =>  'text', 'null' => true],
                'fechaDeCreacion'   => ['type' =>  'date', 'null' => true],
                'fechaDeNacimiento' => ['type' =>  'date', 'null' => true],
                'fechaDefuncion'    => ['type' =>  'date', 'null' => true],
                'fechaModificacion' => ['type' =>  'date', 'null' => true],
                'genero'            => ['type' =>  'text', 'null' => true],
                'nacionalidad'      => ['type' =>  'text', 'null' => true],
                'nombre'            => ['type' =>  'text', 'null' => true],
                'numeroDocumento'   => ['type' =>  'text', 'null' => true],
                'piso'              => ['type' =>  'text', 'null' => true],
                'plataforma'        => ['type' =>  'text', 'null' => true],
                'secretaria'        => ['type' =>  'text', 'null' => true],
                'sexo'              => ['type' =>  'text', 'null' => true],
                'telefono'          => ['type' =>  'text', 'null' => true],
                'telefonoLaboral'   => ['type' =>  'text', 'null' => true],
                'tipoDeDocumento'   => ['type' =>  'text', 'null' => true],
                'torre'             => ['type' =>  'text', 'null' => true],
                'username'          => ['type' =>  'text', 'null' => false],
                'verificado'        => ['type' =>  'text', 'null' => true],
                'created_at'        => ['type' => 'datetime', 'null' => false],
                'updated_at'        => ['type' => 'datetime', 'null' => true]
            ]);

        $this
            ->forge
            ->addKey('id', true);

        $this
            ->forge
            ->createTable('buv_data',false,['ENGINE' => 'InnoDB']);
    }

    public function down()
    {
        $this
            ->forge
            ->dropTable('buv_data');
        $this
            ->forge
            ->dropTable('load_data_errors');
    }
}
