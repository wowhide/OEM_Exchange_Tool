BEGIN{
	print "#!/bin/bash"
	print "cd /Users/pc150401/Desktop/"
	printf("mkdir %s\n",MAKEOBJ)
	DIR=""
	ORGDIR="dev"

}


{
	#ディレクトリか判定をする
	if ($0~/.*:$/){
		DIR = $0
		sub(/:/,"",DIR)
		sub(TARGET,"",DIR)
		DIR = DIR "/"
		printf("mkdir %s%s\n",MAKEOBJ,DIR)
		next
	}

	#NULL行か判定をする
	if ($0 ~ /^[ 	]*$/){
		next
	}

	#
	if (DIR==""){
		next
	}
	if (NF==9){
		if ($0 ~ /^d.*/){
			printf("mkdir %s%s%s\n",MAKEOBJ,DIR,$9)
		} else {

			if ($9 ~ /.php$/ || $9 ~ /.tpl/ || $9 ~ /.html/){
				printf("sed -f sed.txt %s%s%s > %s%s%s\n",TARGET,DIR,$9,MAKEOBJ,DIR,$9)
			} else {
				printf("cp %s%s%s %s%s%s\n",TARGET,DIR,$9,MAKEOBJ,DIR,$9)

			}
		}
	
	}
}

END{

	printf("mv %s/folder_app_ms-%s %s/folder_app_ms-%s\n",MAKEOBJ,ORGDIR,MAKEOBJ,MAKEOBJ)	
	printf("mv %s/public_html/ms-dev %s/public_html/ms-%s\n",MAKEOBJ,MAKEOBJ,MAKEOBJ)

	printf("mkdir %s/push-%s\n",MAKEOBJ,MAKEOBJ)

	printf("mv  %s/folder_app_ms-%s/AndroidPushNotifier.php   %s/push-%s/AndroidPushNotifier.php\n",MAKEOBJ,MAKEOBJ,MAKEOBJ,MAKEOBJ)

	printf("mv  %s/folder_app_ms-%s/AppMngData.php   %s/push-%s/AppMngData.php\n",MAKEOBJ,MAKEOBJ,MAKEOBJ,MAKEOBJ)

	printf("mv  %s/folder_app_ms-%s/certificates   %s/push-%s/certificates\n",MAKEOBJ,MAKEOBJ,MAKEOBJ,MAKEOBJ)

	printf("mv  %s/folder_app_ms-%s/certificates_dev   %s/push-%s/certificates_dev\n",MAKEOBJ,MAKEOBJ,MAKEOBJ,MAKEOBJ)

	printf("mv  %s/folder_app_ms-%s/cron_appMngData.php   %s/push-%s/cron_appMngData.php\n",MAKEOBJ,MAKEOBJ,MAKEOBJ,MAKEOBJ)

	printf("mv  %s/folder_app_ms-%s/cron_appPushNotifier.php   %s/push-%s/cron_appPushNotifier.php\n",MAKEOBJ,MAKEOBJ,MAKEOBJ,MAKEOBJ)

	printf("mv  %s/folder_app_ms-%s/iosPushNotifier.php   %s/push-%s/iosPushNotifier.php\n",MAKEOBJ,MAKEOBJ,MAKEOBJ,MAKEOBJ)

	printf("mv  %s/folder_app_ms-%s/push_log_Android   %s/push-%s/push_log_Android\n",MAKEOBJ,MAKEOBJ,MAKEOBJ,MAKEOBJ)

	printf("mv  %s/folder_app_ms-%s/push_log_iOS   %s/push-%s/push_log_iOS\n",MAKEOBJ,MAKEOBJ,MAKEOBJ,MAKEOBJ)

	printf("sed -f sed.txt source/AppMngData.php > %s/push-%s/AppMngData.php\n",MAKEOBJ,MAKEOBJ)
	printf("cp source/php.ini  %s/push-%s/php.ini\n",MAKEOBJ,MAKEOBJ)
	printf("sed -f sed.txt source/.htaccess > %s/public_html/ms-%s/.htaccess\n",MAKEOBJ,MAKEOBJ)

}