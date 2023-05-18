<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Logs extends Migration
{
    public function up()
    {
        $this
            ->forge
            ->addField([
                'id'                => ['type' => 'INT', 'auto_increment' => true],
                'op'                => ['type' => 'varchar', 'constraint' => 1, 'null' => false],
                'id_rec'            => ['type' => 'INT', 'null' => false],
                'user'              => ['type' => 'text', 'null' => true],
                'prev'              => ['type' => 'text', 'null' => true],
                'post'              => ['type' => 'text', 'null' => true],
                'created_at'        => ['type' => 'datetime', 'null' => false],
            ]);

        $this
            ->forge
            ->addKey('id', true);

        $this
            ->forge
            ->createTable('buv_logs',false,['ENGINE' => 'InnoDB']);
    }

    public function down()
    {
        $this
            ->forge
            ->dropTable('buv_logs');

    }
}
