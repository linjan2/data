# data

```sh
# copy first 1000 words to output
sed -n '1,+1000p' wordlist.txt --output=1.txt

# randomize
sort --random-sort wordlist.txt --output=wordlist-random.txt

# split list into multiples files with 1000 words each (last file contains last chunk + remainder).
# outputs words in JSON arrays to files output/N.json where N is the chunk number.
./split.sh wordlist.txt
```
