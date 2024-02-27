#!/bin/bash

success_count = 0
fail_count = 0
DIFF_RES = ""

echo "None flags --------------------------------------------------------"
./s21_cat test.txt > test1.txt
cat test.txt > test2.txt
diff -s test1.txt test2.txt
DIFF_RES="$(diff -s test1.txt test2.txt)"
if [ "$DIFF_RES" == "Files test1.txt and test2.txt are identical" ]
  then
    (( success_count++ ))
      echo "OK"
  else
      (( fail_count++ ))
      echo "FAIL"
fi
rm test1.txt test2.txt

echo "Flag -b --------------------------------------------------------"
./s21_cat -b test.txt > test1.txt
cat -b test.txt > test2.txt
diff -s test1.txt test2.txt
DIFF_RES="$(diff -s test1.txt test2.txt)"
if [ "$DIFF_RES" == "Files test1.txt and test2.txt are identical" ]
  then
    (( success_count++ ))
      echo "OK"
  else
      (( fail_count++ ))
      echo "FAIL"
fi
rm test1.txt test2.txt

echo "Flag -e --------------------------------------------------------"
./s21_cat -e test.txt > test1.txt
cat -e test.txt > test2.txt
diff -s test1.txt test2.txt
DIFF_RES="$(diff -s test1.txt test2.txt)"
if [ "$DIFF_RES" == "Files test1.txt and test2.txt are identical" ]
  then
    (( success_count++ ))
      echo "OK"
  else
      (( fail_count++ ))
      echo "FAIL"
fi
rm test1.txt test2.txt

echo "Flag -n --------------------------------------------------------"
./s21_cat -n test.txt > test1.txt
cat -n test.txt > test2.txt
diff -s test1.txt test2.txt
DIFF_RES="$(diff -s test1.txt test2.txt)"
if [ "$DIFF_RES" == "Files test1.txt and test2.txt are identical" ]
  then
    (( success_count++ ))
      echo "OK"
  else
      (( fail_count++ ))
      echo "FAIL"
fi
rm test1.txt test2.txt

echo "Flag -s --------------------------------------------------------"
./s21_cat -s test.txt > test1.txt
cat -s test.txt > test2.txt
diff -s test1.txt test2.txt
DIFF_RES="$(diff -s test1.txt test2.txt)"
if [ "$DIFF_RES" == "Files test1.txt and test2.txt are identical" ]
  then
    (( success_count++ ))
      echo "OK"
  else
      (( fail_count++ ))
      echo "FAIL"
fi
rm test1.txt test2.txt

echo "Flag -t --------------------------------------------------------"
./s21_cat -t test.txt > test1.txt
cat -t test.txt > test2.txt
diff -s test1.txt test2.txt
DIFF_RES="$(diff -s test1.txt test2.txt)"
if [ "$DIFF_RES" == "Files test1.txt and test2.txt are identical" ]
  then
    (( success_count++ ))
      echo "OK"
  else
      (( fail_count++ ))
      echo "FAIL"
fi
rm test1.txt test2.txt

echo "SUCCESS: $success_count"
echo "FAIL: $fail_count"