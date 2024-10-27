import pymongo

client = pymongo.MongoClient("mongodb+srv://nidhipadma:wbUjTCvU5o2YQ3Ng@clusterglorp.chdsg.mongodb.net/?retryWrites=true&w=majority&appName=ClusterGlorp")
db = client["sorm"]
collection = db["translation_logs"]

# data = [
#     {"name": "Alice", "age": 25},
#     {"name": "Bob", "age": 35}
# ]


def data_entry(data):
    print(data)
    result = collection.insert_many(data)
    print("done")
