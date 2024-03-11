users = [
    {"id": 0, "name": "Hero"},
    {"id": 1, "name": "Dunn"},
    {"id": 2, "name": "Sue"},
    {"id": 3, "name": "Chi"},
    {"id": 4, "name": "Thor"},
    {"id": 5, "name": "Clive"},
    {"id": 6, "name": "Hicks"},
    {"id": 7, "name": "Devin"},
    {"id": 8, "name": "Kate"},
    {"id": 9, "name": "Klein"}
]

friendship_pairs = [(0, 1), (0, 2), (1, 2), (1, 3), (2, 3), (3, 4),
                    (4, 5), (5, 6), (5, 7), (6, 8), (7, 8), (8, 9)]

# zadanie: utworzyć słownik, gdzie: idUser: idFriendX

slownik = {user["id"]: [] for user in users}

for znajomosc in friendship_pairs:
    slownik[znajomosc[0]].append(znajomosc[1])
    slownik[znajomosc[1]].append(znajomosc[0])

# zadanie: średnia liczba znajomych

wszyscy_znajomi = 0


def liczba_znajomych(u):
    return len(slownik[u])


for user in slownik:
    wszyscy_znajomi += liczba_znajomych(user)

srednia = wszyscy_znajomi / len(slownik)

# zadanie: krotka(userId: numOfFriends)

friends_by_id = [(user["id"], liczba_znajomych(user["id"])) for user in users]
friends_by_id.sort(key=lambda x: x[1], reverse=True)