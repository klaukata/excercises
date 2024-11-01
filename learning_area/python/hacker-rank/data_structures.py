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

# Insert a Node at the Tail of a Linked List
# LINK - https://www.hackerrank.com/challenges/insert-a-node-at-the-tail-of-a-linked-list/problem?isFullScreen=true
def insertNodeAtTail(head, data):
    current = head
    node = SinglyLinkedListNode(data)
    if current:
        while current.next:
            current = current.next
        current.next = node
        return head
    else:
        return node
    
# Insert a node at the head of a linked list
# LINK - https://www.hackerrank.com/challenges/insert-a-node-at-the-head-of-a-linked-list/problem?isFullScreen=true
def insertNodeAtHead(llist, data):
    node = SinglyLinkedListNode(data)
    node.next = llist
    return node

# Insert a node at a specific position in a linked list
# LINK - https://www.hackerrank.com/challenges/insert-a-node-at-a-specific-position-in-a-linked-list/problem?isFullScreen=true
def insertNodeAtPosition(llist, data, position):
    current = llist
    node = SinglyLinkedListNode(data)
    if current:
        count = 0
        while current: # ?
            if count + 1 == position:
                node.next = current.next
                current.next = node
                return llist
            else:
                count += 1
                current = current.next
        return
    else:
        return node