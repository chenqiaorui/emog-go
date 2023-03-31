package main

import (
	"fmt"
	"io/ioutil"
	"os"
)

func main() {
	inputFile := "products.txt"
	outputFile := "prducts_copy.txt"

	buf, err := ioutil.ReadFile(inputFile)

	if err != nil {
		fmt.Printf("err is %s\n", err)
		fmt.Fprintf(os.Stderr, "File Error: %s\n", err)
	}
	err = ioutil.WriteFile(outputFile, buf, 0644) // oct, not hex
	if err != nil {
		panic(err.Error())
	}
}
