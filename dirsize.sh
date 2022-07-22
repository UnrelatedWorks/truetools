#List all files in the directory in descending order by size. Makes it simple to find extremly big/small files.
du -sh -- * | sort -h
