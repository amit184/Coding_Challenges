package main

import (
	"encoding/json"
	"fmt"
)


func main() {
	//amit_Info := `{"birds":{"pigeon":"likes to perch on rocks","eagle":"bird of prey"},"animals":"none"}`
	test_case := `{"a":{"b":{"c":"d"}}}`
	getData(test_case, "b")
}


 func getData(object string, keyString string) {
	var details map[string]any
	json.Unmarshal([]byte(object), &details)
	fmt.Println(details)
	result := details[keyString].(map[string]any)
	for key, value := range result {
		// Each value is an `any` type, that is type asserted as a string
		fmt.Printf("%s : %s\n", key, value)
	}
 }
