<?php

$routes->get('/api/buv/getUserInfo', 'Api\Buv::getUserInfo');
$routes->get('/api/buv/count', 'Api\Buv::getCount');

$routes->resource('api/buv');

