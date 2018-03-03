BEGIN{
	
	FS	= "[\t ][\t ]*:[\t ][\t ]*"

}
{
	if ($0 ~ "^[\t ]*#") next

	if ($1~/^DATABASE$/){
		DATABASE = $2
		if ($2==""){
			gsub($1 "[\t ]*","",$0)
			USER = $0
		}
		next
	}

	if ($1~/^USER$/){
		USER = $2
		if ($2==""){
			gsub($1 "[\t ]*","",$0)
			USER = $0
		}
		next
	}

	if ($1~/^PASS$/){
		PASS = $2
		if ($2==""){
			gsub($1 "[\t ]*","",$0)
			PASS = $0
		}
		next
	}

	if ($1~/^host$/){
		host = $2
		if ($2==""){
			gsub($1 "[\t ]*","",$0)
			host = $0
		}
		next
	}


	if ($1~/^TARGET$/){
		TARGET = $2
		if ($2==""){
			gsub($1 "[\t ]*","",$0)
			TARGET = $0
		}
		next
	}

	if ($1~/^SOURCE$/){
		host = $2
		if ($2==""){
			gsub($1 "[\t ]*","",$0)
			SOURCE = $0
		}
		next
	}

	if ($0~/^S/ || $0~/^s/){
		printf("s/%s/%s/g\n",$2,$3)
	}
}

END{
	printf("s/%s/%s/g\n",SOURCE,TARGET)

#　$path = '/home/photo-cube/memorial-site.net/folder_app_ms-kazuya';
#　$path = '.:/virtual/htdocs/folder_app_ms-kazuya/';

	printf("/\\\$path *= *\\\'\\\/home\\\/photo-cube/{\n")
	printf("s/.*/\\\$path = \'\.:\\\/virtual\\\/htdocs\\\/folder_app_ms-%s\\\/\'\\\;/\n",TARGET)
	printf("}\n")

# Zend_Controller_Front::run('application/controllers');
# Zend_Controller_Front::run('../../folder_app_ms-kazuya/application/controllers');

	printf("/Zend_Controller_Front::run(\\\'application\\\/controllers\\\')\\\;/{\n")
	printf("s/.*/Zend_Controller_Front::run(\\\'\\\.\\\.\\\/\\\.\\\.\\\/folder_app_ms-%s\\\/application\\\/controllers\\\')\\\;/\n",TARGET)
	printf("}\n")

	printf("s/define(\'DB_DATABASE\'.*/define(\'DB_DATABASE\', 	\'%s\');/\n",DATABASE)
	printf("s/define(\'DB_USER\'.*/define(\'DB_USER\', 			'%s');/\n",USER)
	printf("s/define(\'DB_PASS\'.*/define(\'DB_PASS\', 			\'%s\');/\n",PASS)
	printf("s/define(\'DSN\'.*/define(\'DSN\', 					\'mysql:host=127.0.0.1;dbname=\' . DB_DATABASE);/\n",host)

	printf("/\\$dsn/{\n")	
		printf("	s/dbname=[^;]*\\;/dbname=%s\\;/\n",DATABASE)
		printf("	s/host=.*/host=%s\\\'\\;/\n",host)
	printf("}\n")

	printf("s/\$dbuser  *=  *.*\\;/$dbuser = \'%s\'\\;/\n",USER)
	printf("s/\$dbpass  *=  *.*\\;/$dbpass = \'%s\'\\;/\n",PASS)


}
