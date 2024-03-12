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

# zadanie: użytkownicy których możesz znać, funkcja(user) -> [lista]


def foaf(userId):
    result = []
    for friend in slownik[userId]:
        for foaf in slownik[friend]:
            if foaf not in slownik[userId] and foaf != userId:
                result.append(foaf)
    return list(set(result))


interests = [
    (0, "Hadoop"), (0, "Big Data"), (0, "HBase"), (0, "Java"),
    (0, "Spark"), (0, "Storm"), (0, "Cassandra"),
    (1, "NoSQL"), (1, "MongoDB"), (1, "Cassandra"), (1, "HBase"),
    (1, "Postgres"), (2, "Python"), (2, "scikit-learn"), (2, "scipy"),
    (2, "numpy"), (2, "statsmodels"), (2, "pandas"), (3, "R"), (3, "Python"),
    (3, "statistics"), (3, "regression"), (3, "probability"),
    (4, "machine learning"), (4, "regression"), (4, "decision trees"),
    (4, "libsvm"), (5, "Python"), (5, "R"), (5, "Java"), (5, "C++"),
    (5, "Haskell"), (5, "programming languages"), (6, "statistics"),
    (6, "probability"), (6, "mathematics"), (6, "theory"),
    (7, "machine learning"), (7, "scikit-learn"), (7, "Mahout"),
    (7, "neural networks"), (8, "neural networks"), (8, "deep learning"),
    (8, "Big Data"), (8, "artificial intelligence"), (9, "Hadoop"),
    (9, "Java"), (9, "MapReduce"), (9, "Big Data")
]

from collections import defaultdict

user_by_interest = defaultdict(list)

for user, interest in interests:
    user_by_interest[interest].append(user)

print(user_by_interest)
