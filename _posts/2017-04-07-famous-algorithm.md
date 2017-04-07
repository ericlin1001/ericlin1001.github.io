---
layout: post
title: "famous algorithm"
---

# [Median of medians](https://en.wikipedia.org/wiki/Median_of_medians)
The optimal algorithm selecting kth largest element,with linear time complexity $$O(n)$$  
Reference: [https://en.wikipedia.org/wiki/Median_of_medians](https://en.wikipedia.org/wiki/Median_of_medians)

Pseudocode:
~~~
function select(list, left, right, n)
	if left = right
		return left
	loop
		pivotIndex := pivot(list, left, right)
		pivotIndex := partition(list, left, right, pivotIndex)
		if n = pivotIndex
			return n
		else if n < pivotIndex
			right := pivotIndex - 1
		else
			left := pivotIndex + 1

function partition(list, left, right, pivotIndex)
	pivotValue := list[pivotIndex]
	swap list[pivotIndex] and list[right]  // Move pivot to end
	storeIndex := left
	for i from left to right-1
		if list[i] < pivotValue
			swap list[storeIndex] and list[i]
			increment storeIndex
	swap list[right] and list[storeIndex]  // Move pivot to its final place
	return storeIndex


function pivot(list, left, right)
	// for 5 or less elements just get median
	if right - left < 5:
		return partition5(list, left, right)
	// otherwise move the medians of five-element subgroups to the first n/5 positions
	for i from left to right in steps of 5
		// get the median of the ith five-element subgroup
		subRight := i + 4
		if subRight > right:
			subRight := right

		median5 := partition5(list, i, subRight)
		swap list[median5] and list[left + floor((i - left)/5)]

	// compute the median of the n/5 medians-of-five
	return select(list, left, left + ceil((right - left) / 5) - 1, left + (right - left)/10)

function partition5(list,left,right)
	//based on insertion sort.
	mid=floor((left+right)/2)
	for i from left+1 to right
		j=i;
		while j>0 && list[j-1]>list[j]
			swap(list,j-1,j);
			j=j-1
	return mid
~~~


# [HeapSort](https://en.wikipedia.org/wiki/Heapsort)
Reference: https://en.wikipedia.org/wiki/Heapsort

Pseudocode:
~~~
Parent(i)     = floor((i-1) / 2)
iLeftChild(i)  = 2*i + 1
iRightChild(i) = 2*i + 2

procedure heapsort(a, count) is
	input: an unordered array a of length count

	(Build the heap in array a so that largest value is at the root)
	heapify(a, count)

	(The following loop maintains the invariants that a[0:end] is a heap and every element
	 beyond end is greater than everything before it (so a[end:count] is in sorted order))
	end ← count - 1
	while end > 0 do
		(a[0] is the root and largest value. The swap moves it in front of the sorted elements.)
		swap(a[end], a[0])
		(the heap size is reduced by one)
		end ← end - 1
		(the swap ruined the heap property, so restore it)
		siftDown(a, 0, end)

(Put elements of 'a' in heap order, in-place)
procedure heapify(a, count) is
	(start is assigned the index in 'a' of the last parent node)
	(the last element in a 0-based array is at index count-1; find the parent of that element)
	start ← iParent(count-1)

	while start ≥ 0 do
		(sift down the node at index 'start' to the proper place such that all nodes below
		 the start index are in heap order)
		siftDown(a, start, count - 1)
		(go to the next parent node)
		start ← start - 1
	(after sifting down the root all nodes/elements are in heap order)

(Repair the heap whose root element is at index 'start', assuming the heaps rooted at its children are valid)
procedure siftDown(a, start, end) is
	root ← start

	while iLeftChild(root) ≤ end do    (While the root has at least one child)
		child ← iLeftChild(root)   (Left child of root)
		swap ← root                (Keeps track of child to swap with)

		if a[swap] < a[child]
			swap ← child
		(If there is a right child and that child is greater)
		if child+1 ≤ end and a[swap] < a[child+1]
			swap ← child + 1
		if swap = root
			(The root holds the largest element. Since we assume the heaps rooted at the
			 children are valid, this means that we are done.)
			return
		else
			swap(a[root], a[swap])
			root ← swap            (repeat to continue sifting down the child now)
~~~
