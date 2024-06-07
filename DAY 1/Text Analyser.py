def filter_short_names(names, max_length):
    short_names = list(filter(lambda name: len(name) < max_length, names))
    return short_names
product_names = [
    "Laptop",
    "mouse",
    "keyboard",
    "monitor",
    "tab",
    "iphone",
    "Charger",
    "camera",
    "speaker",
    "earphones"
]
filtered_names = filter_short_names(product_names, 7)
print(filtered_names) 
