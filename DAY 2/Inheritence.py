class Product:
    def __init__(self, name, price, category):
        self.name = name
        self.price = price
        self.category = category

    def apply_discount(self, discount):
        self.price -= self.price * discount
        return self.price

    def __str__(self):
        return f"Product(name={self.name}, price={self.price:.2f}, category={self.category})"


class Electronics(Product):
    def __init__(self, name, price, warranty):
        super().__init__(name, price, "Electronics")
        self.warranty = warranty

    def __str__(self):
        return f"Electronics(name={self.name}, price={self.price:.2f}, warranty={self.warranty} years)"


class Clothing(Product):
    def __init__(self, name, price, size, material):
        super().__init__(name, price, "Clothing")
        self.size = size
        self.material = material

    def apply_discount(self, discount):
        
        max_discount = 0.50  # 50%
        actual_discount = min(discount, max_discount)
        return super().apply_discount(actual_discount)

    def __str__(self):
        return f"Clothing(name={self.name}, price={self.price:.2f}, size={self.size}, material={self.material})"


class Book(Product):
    def __init__(self, name, price, author, pages):
        super().__init__(name, price, "Book")
        self.author = author
        self.pages = pages

    def __str__(self):
        return f"Book(name={self.name}, price={self.price:.2f}, author={self.author}, pages={self.pages})"



if __name__ == "__main__":
    
    laptop = Electronics("Laptop", 1200.00, 2)
    tshirt = Clothing("T-Shirt", 20.00, "M", "Cotton")
    novel = Book("Novel", 15.00, "Author Name", 350)

   
    print(laptop)
    print(tshirt)
    print(novel)

    
    print("\nApplying discounts...")
    laptop.apply_discount(0.10)  
    tshirt.apply_discount(0.30)  
    novel.apply_discount(0.15)   

   
    print(laptop)
    print(tshirt)
    print(novel)
