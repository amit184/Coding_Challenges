package main

import (
	"encoding/json"
	"fmt"
)


func main() {
	bird_Info := `{"birds":{"pigeon":"likes to perch on rocks","eagle":"bird of prey"},"animals":"none"}`
	getData(bird_Info, "animals")
	// test_case := `{"a":{"b":{"c":"d"}}}`
	// getData(test_case, "a")
}


 func getData(object string, keyString string) {
	var details map[string]any
	json.Unmarshal([]byte(object), &details)
	fmt.Println(details)
	result := details[keyString]
	fmt.Println(result)
 }
