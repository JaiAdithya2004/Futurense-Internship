def analyze_list(numbers):
    min_value = min(numbers)
    max_value = max(numbers)
    average_value = sum(numbers) / len(numbers)
    statistics = {
        "min": min_value,
        "max": max_value,
        "average": average_value
    }
    return statistics
numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
result = analyze_list(numbers)
print(result)  
