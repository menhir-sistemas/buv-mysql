<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class LogsTableName extends Migration
{
    public function up()
    {
        $this
            ->forge
            ->addColumn('buv_logs',[
                'table_name' => ['type' =>  'text', 'null' => true, 'after' => 'op'],
            ]);    
    }

    public function down()
    {
        $this
            ->forge
            ->dropColumn('buv_logs','table_name');
    }
}
