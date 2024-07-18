// Generate a random valid SELCAL code systematically

package main

import (
	"fmt"
	"math/rand/v2"
)

func main() {
	//Fill array with int -> letter mappings for SELCAL
	l := [16]string{"A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M", "P", "Q", "R", "S"}

	//Generate 1st letter and fill all spots with the same one
	r := rand.IntN(15)
	c := [4]int{r, r, r, r}

	//Generate 2nd letter until it's different from the 1st
	for c[1] == c[0] {
		c[1] = rand.IntN(15)
	}

	//Generate 3rd letter until it's different from 1 and 2
	for c[2] == c[0] ||
		c[2] == c[1] {
		c[2] = rand.IntN(15)
	}

	//Generate 3rd letter until it's different from 1, 2, and 3
	for c[3] == c[0] ||
		c[3] == c[1] ||
		c[3] == c[2] {
		c[3] = rand.IntN(15)
	}

	//Reverse 1st and 2nd letter if not in order
	if c[0] > c[1] {
		c_t := c[0]
		c[0] = c[1]
		c[1] = c_t
	}

	//Reverse 3rd and 4th letter if not in order
	if c[2] > c[3] {
		c_t := c[2]
		c[2] = c[3]
		c[3] = c_t
	}

	//Build the final string, including mapping ints to letter strings
	fmt.Println(l[c[0]] + l[c[1]] + "-" + l[c[2]] + l[c[3]])
}
