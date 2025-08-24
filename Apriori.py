from itertools import combinations

# Sample dataset (transactions)
transactions = [
    ['milk', 'bread', 'eggs'],
    ['bread', 'butter'],
    ['milk', 'bread', 'butter', 'eggs'],
    ['milk', 'bread'],
    ['bread', 'butter', 'eggs']
]

# Minimum thresholds
min_support = 0.4
min_confidence = 0.6

# Step 1: Calculate support of itemsets
def get_support(itemset, transactions):
    count = 0
    for transaction in transactions:
        if set(itemset).issubset(set(transaction)):
            count += 1
    return count / len(transactions)

# Step 2: Generate frequent itemsets
def apriori(transactions, min_support):
    items = set(item for t in transactions for item in t)
    freq_itemsets = []
    current_itemsets = [[item] for item in items]

    while current_itemsets:
        next_itemsets = []
        for itemset in current_itemsets:
            support = get_support(itemset, transactions)
            if support >= min_support:
                freq_itemsets.append((itemset, support))
                # Generate new candidates
                for item in items:
                    new_itemset = sorted(list(set(itemset) | {item}))
                    if new_itemset not in next_itemsets and len(new_itemset) == len(itemset)+1:
                        next_itemsets.append(new_itemset)
        current_itemsets = next_itemsets
    return freq_itemsets

# Step 3: Generate association rules
def generate_rules(freq_itemsets, transactions, min_confidence):
    rules = []
    for itemset, support in freq_itemsets:
        if len(itemset) > 1:
            for i in range(1, len(itemset)):
                for antecedent in combinations(itemset, i):
                    antecedent = list(antecedent)
                    consequent = list(set(itemset) - set(antecedent))
                    support_itemset = get_support(itemset, transactions)
                    support_antecedent = get_support(antecedent, transactions)
                    confidence = support_itemset / support_antecedent
                    lift = confidence / get_support(consequent, transactions)
                    if confidence >= min_confidence:
                        rules.append((antecedent, consequent, support_itemset, confidence, lift))
    return rules

# Run Apriori
freq_itemsets = apriori(transactions, min_support)
rules = generate_rules(freq_itemsets, transactions, min_confidence)

# Output results
print("✅ Frequent Itemsets:")
for itemset, support in freq_itemsets:
    print(f"{itemset} : {round(support, 2)}")

print("\n📊 Association Rules:")
for rule in rules:
    antecedent, consequent, support, confidence, lift = rule
    print(f"{antecedent} -> {consequent} | support={round(support,2)}, confidence={round(confidence,2)}, lift={round(lift,2)}")
