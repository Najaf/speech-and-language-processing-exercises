#! /bin/bash
wget http://d3t3fd87rd28b5.cloudfront.net/one_meelyun_sentences.bz2
bzip2 -d one_meelyun_sentences.bz2
mv one_meelyun_sentences corpus.txt
