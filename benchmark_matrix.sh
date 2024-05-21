#!/bin/bash

# File paths
BEND_FILE="matrix.bend"
PYTHON_FILE="matrix.py"

# Number of iterations for benchmarking
ITERATIONS=3

# Function to calculate the minimum time
minimum_time() {
  min=${times[0]}
  for time in "${times[@]}"; do
    if (( $(echo "$time < $min" | bc -l) )); then
      min=$time
    fi
  done
  echo $min
}


# Benchmark Bend code (bend run-c)
echo "Benchmarking Bend code (bend run-c)..."
times=()
for i in $(seq 1 $ITERATIONS); do
  start=$(date +%s.%N)
  bend run-c $BEND_FILE 
  end=$(date +%s.%N)
  runtime=$(echo "$end - $start" | bc)
  times+=($runtime)
  echo "."
done
min_bend_run_c=$(minimum_time)
echo "Minimum execution time for Bend code (bend run-c): $min_bend_run_c seconds"

# Benchmark Python code
echo "Benchmarking Python code..."
times=()
for i in $(seq 1 $ITERATIONS); do
  start=$(date +%s.%N)
  python3 $PYTHON_FILE 
  end=$(date +%s.%N)
  runtime=$(echo "$end - $start" | bc)
  times+=($runtime)
  echo "."
done
min_python=$(minimum_time)
echo "Minimum execution time for Python code: $min_python seconds"

# Output results
echo "Benchmark Results:"
echo "Bend (run) minimum execution time: $min_bend_run seconds"
echo "Bend (run-c) minimum execution time: $min_bend_run_c seconds"
echo "Python minimum execution time: $min_python seconds"

