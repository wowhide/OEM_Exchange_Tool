#!/bin/bash
#MY_DIRNAME=$(dirname $0)
#cd $MY_DIRNAME

target=premium_v2_memorial-site
makeobj=kazuya

# ディスクトップに作業ディレクトリを変更する
cd "/Users/pc150401/Desktop/"

# -e ファイルが存在していれば真
if [ -e $target ]; then
	if [ -d $target ]; then
		echo "find $target."
		if [ -e $makeobj ]; then
			echo "there is $makeobj."
			exit
		else
			echo "make $makeobj directory."
		fi
	else
		echo "$target is not directory."
		exit
	fi
else
	echo "$target NOT found."
	exit
fi

# lsコマンド　オプション　-l ファイルの詳細も表示する、　-R ディレクトリの内容を再帰的に表示
ls -lR $target > tmp.txt
# read -p "Hit enter: "


# -v オプション　＝　変数を定義、　-f オプション　＝　awkスクリプトが書かれたファイルを定義する
# awk -v "TARGET=$target" -v "MAKEOBJ=$makeobj" -f makecmd.awk tmp.txt > a.command
# rm tmp.txt

# awk -v "SOURCE=$target" -v "TARGET=$makeobj" -f makesed.awk makesed.txt > sed.txt
# chmod u+x a.command
# read -p "Hit enter: "


