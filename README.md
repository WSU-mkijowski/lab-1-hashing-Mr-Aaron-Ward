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


---

### Task 2: Crypto Mining

**Reminder Deliverable:** Is your "mining" code in this repository (`mining/`)?
**Reminder Deliverable:** Is your nonce + word combos in `coins.txt`?

Answer the following:

* Paste your ***nonce+word(s) and hash(s)*** below ( either 3x `000` hashes or 1x `0000`
hash)

```

```

* How many words were in your dictionary?
* How many nonces did your code iterate over?
* What was the maximum number of hashes your code *could* compute given the above?
* What did you think about Task 2?
* Is there a better way than brute force to attempt to get higher valued coins?
* Why or why not?


```bash
please put any cool bash one-liners or other piped commands you
learned/struggled with for task 2 here
```

