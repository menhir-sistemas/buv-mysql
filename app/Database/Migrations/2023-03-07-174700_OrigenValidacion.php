<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class OrigenValidacion extends Migration
{
    public function up()
    {
        // Nuevos campos en la buv_data
        $this
            ->forge
            ->addColumn('buv_data',[
                'origenValidacion' => ['type' =>  'text', 'null' => true, 'after' => 'nivelValidacion'],
            ]);
    }

    public function down()
    {
        $this
            ->forge
            ->dropColumn('buv_data',[
                'origenValidacion',
            ]);
    }
}
