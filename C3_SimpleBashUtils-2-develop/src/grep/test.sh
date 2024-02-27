#!/bin/bash

success_count = 0
fail_count = 0
DIFF_RES = ""

echo "None flags --------------------------------------------------------"
./s21_grep lol test.txt > test1.txt
grep lol test.txt > test2.txt
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
./s21_grep -e lol test.txt > test1.txt
grep -e lol test.txt > test2.txt
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

echo "Flag -i --------------------------------------------------------"
./s21_grep -i LOL test.txt > test1.txt
grep -i LOL test.txt > test2.txt
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

echo "Flag -v --------------------------------------------------------"
./s21_grep -v lol test.txt > test1.txt
grep -v lol test.txt > test2.txt
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

echo "Flag -c --------------------------------------------------------"
./s21_grep -c lol test.txt > test1.txt
grep -c lol test.txt > test2.txt
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

echo "Flag -l --------------------------------------------------------"
./s21_grep -l lol test.txt test_2.txt > test1.txt
grep -l lol test.txt test_2.txt> test2.txt
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
./s21_grep -n lol test.txt > test1.txt
grep -n lol test.txt > test2.txt
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

echo "Flag -h --------------------------------------------------------"
./s21_grep -h lol test.txt > test1.txt
grep -h lol test.txt > test2.txt
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
./s21_grep -s lol test.txt > test1.txt
grep -s lol test.txt > test2.txt
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

echo "Flag -o --------------------------------------------------------"
./s21_grep -o lol test.txt > test1.txt
grep -o lol test.txt > test2.txt
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

echo "Flag -f --------------------------------------------------------"
./s21_grep -f test_2.txt test.txt > test1.txt
grep -f test_2.txt test.txt > test2.txt
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