class BankAccount:
    def __init__(self, account_number, initial_balance=0):
        self.__account_number = account_number
        self.__balance = initial_balance

    def deposit(self, amount):
        if amount > 0:
            self.__balance += amount
            print(f"Deposited {amount:.2f}. New balance: {self.__balance:.2f}")
        else:
            print("Invalid deposit amount.")

    def withdraw(self, amount):
        if 0 < amount <= self.__balance:
            self.__balance -= amount
            print(f"Withdrew {amount:.2f}. New balance: {self.__balance:.2f}")
        else:
            print("Invalid withdrawal amount or insufficient funds.")

    def get_balance(self):
        return self.__balance

    def get_account_number(self):
        return self.__account_number

    def __str__(self):
        return f"BankAccount(account_number={self.__account_number}, balance={self.__balance:.2f})"


class User:
    def __init__(self, name):
        self.__name = name
        self.__accounts = []

    def create_account(self, initial_balance=0):
        account_number = len(self.__accounts) + 1
        account = BankAccount(account_number, initial_balance)
        self.__accounts.append(account)
        print(f"Account created. {account}")

    def get_account(self, account_number):
        for account in self.__accounts:
            if account.get_account_number() == account_number:
                return account
        print("Account not found.")
        return None

    def get_user_info(self):
        return f"User(name={self.__name}, accounts={[str(account) for account in self.__accounts]})"

    def __str__(self):
        return self.get_user_info()



if __name__ == "__main__":
    user = User("John Doe")
    user.create_account(1000)
    user.create_account(500)

    print(user)

    account1 = user.get_account(1)
    if account1:
        account1.deposit(200)
        account1.withdraw(500)
        print(f"Account 1 balance: {account1.get_balance():.2f}")

    account2 = user.get_account(2)
    if account2:
        account2.withdraw(100)
        print(f"Account 2 balance: {account2.get_balance():.2f}")

    print(user)
