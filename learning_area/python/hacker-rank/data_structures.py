# Arrays - DS
# LINK - https://www.hackerrank.com/challenges/arrays-ds/problem?isFullScreen=true
# TODO
def reverseArray(a):
    res = []
    for i in range(len(a) - 1, -1, -1):
        res.append(a[i])
    return res

# Print the Elements of a Linked List
# LINK - https://www.hackerrank.com/challenges/print-the-elements-of-a-linked-list/problem?isFullScreen=true
def printLinkedList(head):
    current = head
    while current:
        print(current.data)
        current = current.next