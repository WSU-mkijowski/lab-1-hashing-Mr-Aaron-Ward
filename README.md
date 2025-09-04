[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/SPs4PNWX)
# Lab 1 : CEG 3400 Intro to Cyber Security

## Name: Aaron Ward

### Task 1: Hashing

**Reminder Deliverable:** Is your `salted-data.csv` in this repository?

Answer the following in this file:

* How many unique users are in the data?
  * 42
* How many salts did you create?
  * 42
* How many possible combinations will I need to try to figure out the secret ID
  of all students (assume I know all potential secret IDs and have your 
  `salted-data.csv`)
    * You would have to try in this case 42(for the number of users) multiplied by the number of potential secret ID's, that is how many combinations you will need to try to find all secret
    ID's 
* Instead of salts, if you were to use a nonce (unique number for each hashed
  field) how many possible combinations would I need to try?
    * In this case you would need to try 1302(for the number of rows) multiplied by the number of 
    potential ID's

* Given the above, if this quiz data were *actual* class data, say for example
  your final exam, how would you store this dataset?  Why?
    * I would make the salts longer like 20 random digits or so and maybe hash a few more times. 
    Both will increase the time it takes for a hacker to crack the data, making it more secure. 

### Commands I used for Task 1

1. `salt=$(echo -n "FLastName" | sha256sum | tr -dc '0-9' | head -c5)`, to generate a salt

2. `printf "%s%s\n" "$salt" "FLastName"`, to prepend the salt to the name

3. `printf  "prepenedSalt" | sha256sum`, to hash the salt

4. `hash=$(printf "prependedSalt" | sha256sum | awk '{print $1}')`, prepend the salt again to the resulting hash

5. `echo "salt$hash"`, to print the salted hash


### Task 2: Crypto Mining

**Reminder Deliverable:** Is your "mining" code in this repository (`mining/`)?
**Reminder Deliverable:** Is your nonce + word combos in `coins.txt`?

```
  00083913eafecef118543ef2df621fbd4c54a351f96086cd4718099cd0f6dce0, 399these
  000ac13d8480c8644dbb50d329cfa8918be92a6b37951a36b6665dcb95713c92, 1792are
  000b0ef440ce731f76fcae2d6a99ac3a8d8bcf38d961bed15d225ea9148a75d4, 3517are
```

* How many words were in your dictionary?
  * 14

* How many nonces did your code iterate over?
  * 5000

* What was the maximum number of hashes your code *could* compute given the above?
  * 70000

* What did you think about Task 2?
  * It was not as bad a task 1, mainly because of the hint given in class. On a serious note it was interesting
  seeing how bitcoin mining is done. I never understood bitcoin mining until now. 

* Is there a better way than brute force to attempt to get higher valued coins?
  * I don't think so

* Why or why not?
  * Brute force always seems to be the best way to go about things if you really want something done. 

### My one liner is what's in miner.sh, its messy but it is a one liner

```
for j in $(cat ..data/dictionary); do for i in $(seq 5000); do string="$i$j"; hashval=$(printf "%s" "$string" | sha256sum | awk '{print $1}'); echo "$hashval, $string"; done; done | grep '^000'
```

