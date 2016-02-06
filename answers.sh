#! /usr/bin/env bash
datasets='/Users/gregkirkpatrick/devel/data-sets'
# Which state has the highest population?

states="$datasets/states.tab.gz"

#answer_0=$(gzcat $states | grep -v '^#' | cut -f1,2 | sort -k2n | tail -n1 | cut -f1 | sed 's/"//g')

#echo "answer-0: $answer_0"

#Question 1: Which state has the lowest murder rate?
answer_1=$(gzcat $states | grep -v '^#' | cut -f1,6 | sort -k2n | head  -n1 | cut -f1 |
sed 's/"//g')

echo "answer-1: $answer_1"

#Question 2: How many sequence records are in the sample.fa file?

answer_2=$(grep -v "^>" $datasets/sample.fa | wc -l)

echo "answer-2: $answer_2"

#Question 3: How many unique CpG IDs are in cpg.bed.gz?

answer_3=$(gzcat $datasets/cpg.bed.gz | cut -f4 | sort | uniq | wc -l)

echo "answer-3: $answer_3"

#Question 4: How many sequence records are in the SP1.fq file?

answer_4=$(cat $datasets/SP1.fq | grep -e "^G" -e "^C" -e "^A" -e "^T" |
wc -l)

echo "answer-4: $answer_4"

#Question 5: How many words are on lines containing the word 'bloody' in
#hamlet.txt?

answer_5=$(cat $datasets/hamlet.txt | grep "bloody" | wc -w)

echo "answer-5: $answer_5"

#Question 6: What is the length of the sequence in the first record of
#sample.fa

answer_6=$(cat $datasets/sample.fa | grep -v "^>" | head -n1 | wc -c)

echo "answer-6: $answer_6"

#Question 7: What is the name of the longest gene in genes.hg19.bed.gz?

answer_7=$(gzcat $datasets/genes.hg19.bed.gz | awk '{print $4, $3 - $2}' |
sort -k2n | tail -n1 | cut -f1 -d' ')

echo "answer-7: $answer_7"

#Question 8: How many unique chromosomes are in genes.hg19.bed.gz?

answer_8=$(gzcat $datasets/genes.hg19.bed.gz | cut -f1 | sort | uniq | wc -l)

echo "answer-8: $answer_8"

#Question 9: How many intervals are associated with CTCF (not CTCFL) in
#peaks.chr22.bed.gz

answer_9=$(gzcat $datasets/peaks.chr22.bed.gz | cut -f4 | grep -w "CTCF" | wc -l)

echo "answer-9: $answer_9"

#Question 10: On what chromosome is the largest interval in lamina.bed?

answer_10=$(cat $datasets/lamina.bed | awk '{print $1, $3 - $2}' | sort -k2n | tail -n1 | cut -f1 -d' ')

echo "answer-10: $answer_10"

