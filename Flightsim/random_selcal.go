package main

import (
	"fmt"
	"math/rand/v2"
)

func main() {
	l := [16]string{"A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M", "P", "Q", "R", "S"}
	r := rand.IntN(15)
	c := [4]int{r, r, r, r}

	for c[1] == c[0] {
		c[1] = rand.IntN(15)
	}

	for c[2] == c[0] ||
		c[2] == c[1] {
		c[2] = rand.IntN(15)
	}

	for c[3] == c[0] ||
		c[3] == c[1] ||
		c[3] == c[2] {
		c[3] = rand.IntN(15)
	}

	if c[0] > c[1] {
		c_t := c[0]
		c[0] = c[1]
		c[1] = c_t
	}

	if c[2] > c[3] {
		c_t := c[2]
		c[2] = c[3]
		c[3] = c_t
	}

	fmt.Println(l[c[0]] + l[c[1]] + "-" + l[c[2]] + l[c[3]])
}
