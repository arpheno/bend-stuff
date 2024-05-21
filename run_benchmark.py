import subprocess
import time
from pprint import pprint


def run_command(command):
    start = time.time()
    subprocess.run(command, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    end = time.time()
    return end - start

def benchmark(command, iterations):
    times = []
    for _ in range(iterations):
        times.append(run_command(command))
        print('.', end='')
    return min(times)

def main():
    iterations = 3
    bend_file = "matrix.bend"
    python_file = "matrix.py"

    commands = [
        #f"bend run {bend_file}",
        f"bend run-c {bend_file}",
        f"python3 naive_matrix.py 10000",
        f"python3 {python_file} 10000"
    ]

    results = {command: benchmark(command, iterations) for command in commands}
    return results

if __name__ == "__main__":
    benchmark_results = main()
    print("")
    pprint(benchmark_results)
