<?php

namespace App\Commands;

use CodeIgniter\CLI\BaseCommand;
use CodeIgniter\CLI\CLI;
use Elasticsearch;

class LoadDataCommand extends BaseCommand
{
    /**
     * The Command's Group
     *
     * @var string
     */
    protected $group = 'CodeIgniter';

    /**
     * The Command's Name
     *
     * @var string
     */
    protected $name = 'load-data';

    /**
     * The Command's Description
     *
     * @var string
     */
    protected $description = '';

    /**
     * The Command's Usage
     *
     * @var string
     */
    protected $usage = <<<MSG_EOF
    load-data         
    MSG_EOF;

    /**
     * The Command's Arguments
     *
     * @var array
     */
    protected $arguments = [];

    /**
     * The Command's Options
     *
     * @var array
     */
    protected $options = [];

	private function log($txt) {
		CLI::write((new \DateTime())->format('d/m/Y H:i:s.v') . ' ' . $txt);
	}


    /**
     * Actually execute a command.
     *
     * @param array $params
     */
    public function run(array $params)
    {
        # Armo los datos de la conexión
        $cfg = Config('BUV');
        $hosts = [
            "{$cfg->elasticSearchProt}://{$cfg->elasticSearchUser}:{$cfg->elasticSearchPass}@{$cfg->elasticSearchHost}:{$cfg->elasticSearchPort}"
        ];

        $this->log('Conectando al elasticsearch');

        $client = Elasticsearch\ClientBuilder::create()->setHosts($hosts)->build();

        // Preparo el scroll
        $qryParams = [
            'scroll' => '10s',
            'size'   => $cfg->elasticSearchPage,
            'index' => $cfg->elasticSearchIndex,
            'body'   => [
                'query' => [
                    'match_all' => new \stdClass()
                ]
            ]
        ];

        $this->log('Comenzando el query');
        $response = $client->search($qryParams);

        $correctos = 0;
        $errores   = 0;

        $errorModel = new \App\Models\LoadDataErrorsModel();
        $rowModel = new \App\Models\BUVDataModel();

        $total = $response['hits']['total']['value'];
        $this->log('Procesando un total de ' . number_format($total,0,',','.') . ' registros');

        $total = $response['hits']['total']['value'];
        while (isset($response['hits']['hits']) && count($response['hits']['hits']) > 0) {

            foreach ($response['hits']['hits'] as $hit) {
                try {
                    $_id = $hit['_id'];
                    $rowModel->newRow($_id,$hit['_source']);
                    $correctos++;
                } catch (\Throwable $th) {
                    $errorModel->insert([
                        '_id' => $_id,
                        'msg' => $th->getMessage()
                    ]);
                    $errores++;
                }
            }

            CLI::showProgress($correctos + $errores,$total);


            // Pido el nuevo scroll

            $scroll_id = $response['_scroll_id'];
        
            $response = $client->scroll([
                'body' => [
                    'scroll_id' => $scroll_id, 
                    'scroll'    => '30s'       
                ]
            ]);
        }        
        CLI::showProgress(false);

        $this->log('Proceso de importación finalizado');
        $tbody = [
            ['Registros OK', number_format($correctos,0,',','.') ],
            ['Registros con errores', number_format($errores,0,',','.') ] ,
            ['Total',  number_format($correctos + $errores,0,',','.') ],
        ];
        
        CLI::table($tbody);


    }
}
