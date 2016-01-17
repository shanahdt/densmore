#####Quick little hack to add super functions -ds, 1/16

###get rid of the tmp file if it's there.
rm -f /tmp/super_function.$$


###create loads of variables with grepping the social function and superfunction.
	social_function=$(grep 'SOCIAL' $1| perl -lane 'splice @F,0,1;print "@F"')
####match superfunction w/ social function with a grep and some cleaning	
	superfunction=$(grep -h "$social_function" DensmoreSocialFunction_DS.tsv | awk 'BEGIN{ FS = "\"" }; {print $3}') 
	
####print off the results and print to tmp files, then move to real file.
	printf "!!!SUPERFUNCTION: $superfunction\n" | sed 's/	//g' | tr -s "," "\n" | sed 's/^ /!!!SUPERFUNCTION: /g' >>  /tmp/super_function.$$
	cat $1 >> /tmp/super_function.$$
	
	mv /tmp/super_function.$$ $1