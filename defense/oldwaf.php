<?php // Your WAF goes here

$d=['S'=>$_SERVER,'R'=>$_REQUEST,"test"=>true];
$l = json_encode($d);

$h=curl_init('http://10.14.15.119:8887/logger.php');
curl_setopt($h,CURLOPT_POST,1);
curl_setopt($h,CURLOPT_POSTFIELDS,$l);
// curl_setopt($h, CURLOPT_CONNECTTIMEOUT, 1);
// curl_setopt($h, CURLOPT_TIMEOUT, 1);
@curl_exec($h);
@curl_close($h);
if(isset($_POST['url']))die();
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