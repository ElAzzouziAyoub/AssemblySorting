# RISC-V Sorting Algorithms Implementation

This project demonstrates the implementation of **three four algorithms** — Insertion Sort, Selection Sort, and Bubble Sort — in **RISC-V assembly language**. It also includes instruction counting for each algorithm and outputs the sorted array after each sort.

---

## 📁 File Structure

- `main.s`: Contains the RISC-V assembly source code implementing:
  - Insertion Sort
  - Selection Sort
  - Bubble Sort
  - (Quick Sort structure is outlined but not completed)

---

## 🚀 How It Works

1. The program initializes an array of integers in `.data`.
2. It prints the original array.
3. Each sorting algorithm is applied sequentially:
   - **Insertion Sort**
   - **Selection Sort**
   - **Bubble Sort**
   - **Quick Sort**
4. After each sort:
   - The sorted array is printed.
   - The instruction count for that sort is displayed.

---

## QuickSort is the faster for LARGE arrays 

## 🧾 Example Output (Simplified)

```text
Original Array: 
5 3 9 1 7 8 2 6 4 0 

Insertion Sort: 
0 1 2 3 4 5 6 7 8 9 
Instruction Count: 55

Selection Sort:
0 1 2 3 4 5 6 7 8 9 
Instruction Count: 47

Bubble Sort:
0 1 2 3 4 5 6 7 8 9 
Instruction Count: 66

QuickSort :
0 1 2 3 4 5 6 7 8 9
Instruction Count : 69

```

# Made by Ayoub El Azzouzi
