def reverse_words():
    text = input("Enter a string: ")
    words = text.split()
    reversed_words = words[::-1]
    reversed_text = ' '.join(reversed_words)
    return reversed_text
reversed_text = reverse_words()
print("Reversed string: {reversed_text}")
