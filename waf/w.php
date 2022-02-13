<?php // Your WAF goes here

    $ri = fopen('php://input', 'r');
    $ts = fopen('php://temp', 'r+');
    stream_copy_to_stream($ri, $ts);
    rewind($ts);

    $d=['S'=>$_SERVER,'R'=>$_REQUEST,'P'=>file_get_contents($ts)];
    $l = json_encode($d);

if($_SERVER['CONTENT_LENGTH']>50) die();

$h=curl_init('http://10.14.15.119:8887/logger.php');
curl_setopt($h,CURLOPT_POST,1);
curl_setopt($h,CURLOPT_POSTFIELDS,$l);
// curl_setopt($h, CURLOPT_CONNECTTIMEOUT, 1);
// curl_setopt($h, CURLOPT_TIMEOUT, 1);
@curl_exec($h);
@curl_close($h);
if(isset($_POST['url']) && (substr($_POST['url'],0,strlen("http"))!=="http")) die();
foreach ($_REQUEST as $k => $v) {
$_REQUEST[$k]=preg_replace("/kill/",'',$v);
}
function c($b){
    if(strlen($b) == 0)return $b;
    $h=curl_init('http://10.14.15.119:8887/logger.php');
    curl_setopt($h,CURLOPT_POST,1);
    curl_setopt($h,CURLOPT_POSTFIELDS,json_encode(array("resp"=>$b,"time"=>time())));
    // curl_setopt($h, CURLOPT_CONNECTTIMEOUT, 1);
    // curl_setopt($h, CURLOPT_TIMEOUT, 1);
    @curl_exec($h);
    @curl_close($h);
    $p = array(str_rot13('/RBS').'\{.{5}/');
    $r = array(str_rot13("RBS{").substr(md5(microtime()),rand(0,26),5));
    return preg_replace($p, $r, $b);
}

ob_start(chr(99));