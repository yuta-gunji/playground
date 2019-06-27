package main

import (
  "fmt"
  "math"
)

const weight = 60
const height = 167

func main() {
  var hm = height / 100.0
  var bmi = weight / math.Pow(hm, 2)
  var bestW = math.Pow(hm, 2) * 22.0
  var per = weight / bestW * 100

  fmt.Printf("BMI=%f, fatRate=%.0f\n", bmi, per)
}
