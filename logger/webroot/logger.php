<?php

$body = file_get_contents("php://input");
$data = json_decode($body, true);
$data['time'] = time();
// $log = date("Y-m-d H:i:s")."\t".$body."\n";

file_put_contents("../log/acc.2.log", json_encode($data)."\n", FILE_APPEND);
