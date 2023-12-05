# This code is for preprocess data that return by the apriori algorithm

import csv

with open("association_rules.csv", newline="") as csvfile, open(
    "converted_assoc_rules.csv", "w", newline=""
) as new_csvfile:
    reader = csv.reader(csvfile)
    writer = csv.writer(new_csvfile)
    headers = next(reader)
    writer.writerow(headers)
    for row in reader:
        column2 = eval(row[1].replace("frozenset", "set"))
        column3 = eval(row[2].replace("frozenset", "set"))
        row[1] = list(column2)
        row[2] = list(column3)
        writer.writerow(row)

with open("association_rules.csv", newline="") as csvfile:
    reader = csv.reader(csvfile)
    next(reader)  # skip the first row
    items = set()
    for row in reader:
        items.update(eval(row[1].replace("frozenset", "set")))

available_items = sorted(items)
purchases = []

while True:
    print("Available items:")
    for index, item in enumerate(available_items):
        print(f"{index} - {item}")
    print("What would you like to purchase? Select '-1' for exit.")
    selection = int(input())
    if selection == -1:
        break
    purchases.append(available_items[selection])

purchased = list(set(purchases))
print(f"You selected: {purchased}")

with open("converted_assoc_rules.csv", newline="") as csvfile:
    reader = csv.reader(csvfile)
    next(reader)  # skip the first row
    for row in reader:
        if set(eval(row[1])).issubset(set(purchased)):
            print(f"Recommended products: {eval(row[2])} - Confidence: {row[3]}")
