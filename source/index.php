<?php
	$path = '.:/virtual/htdocs/folder_app_ms-nichitest/';
    set_include_path(get_include_path() . PATH_SEPARATOR . $path);

    require_once 'Zend/Controller/Front.php';

    date_default_timezone_set('Asia/Tokyo');    // 日本のタイムゾーンに設定
    Zend_Controller_Front::getInstance()->setParam('noViewRenderer', true);
    Zend_Controller_Front::run('../../folder_app_ms-nichitest/application/controllers');
