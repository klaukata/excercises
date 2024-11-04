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
        while current:
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
    
# Delete a Node
# LINK - https://www.hackerrank.com/challenges/delete-a-node-from-a-linked-list/problem?isFullScreen=true
def deleteNode(llist, position):
    count = 0
    current = llist
    if position != 0:
        while current:
            if position == count + 1:
                previous = current
                to_remove = current.next
                following = to_remove.next
                previous.next = following
            count += 1
            current = current.next
    else:
        llist = current.next
    return llist

# Reverse a linked list
# LINK - https://www.hackerrank.com/challenges/reverse-a-linked-list/problem?isFullScreen=true
def reverse(llist):
    result = None
    current = llist
    while current:
        node = SinglyLinkedListNode(current.data)
        node.next = result
        result = node
        current = current.next
    return result

# Compare two linked lists
# LINK - https://www.hackerrank.com/challenges/compare-two-linked-lists/problem?isFullScreen=true
def compare_lists(llist1, llist2):
    are_equal = False
    l1 = llist1
    l2 = llist2
    while l1 and l2:
        if l1.data == l2.data:
            if l1.next is None and l2.next is None:
                are_equal = True
                break
            else:
                l1 = l1.next
                l2 = l2.next
        else:
            break
    return int(are_equal)

# Counting Valleys
# LINK - https://www.hackerrank.com/challenges/three-month-preparation-kit-counting-valleys/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-two
def countingValleys(steps, path):
    sea_lvl = 0
    v_n = 0
    for i in range(steps):
        if path[i] == 'U':
            sea_lvl += 1
            if sea_lvl == 0 and i != 0:
                v_n += 1
        elif path[i] == 'D':
            sea_lvl -= 1
    return v_n