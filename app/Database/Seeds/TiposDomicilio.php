<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;


class TiposDomicilio extends Seeder
{
    public function run()
    {
        $tiposDomicilio = [
            [ 'descripcion' => 'REGISTRADO'],
            [ 'descripcion' => 'REAL'],
            [ 'descripcion' => 'LEGAL'],
            [ 'descripcion' => 'LABORAL'],
        ];

        $rec = new \App\Models\TipoDomicilioModel();
        foreach ($tiposDomicilio as $td) {
            $rec->insert($td);
        }
    }
}
