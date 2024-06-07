class FileSystemEntity:
    def __init__(self, name):
        self.name = name

    def get_size(self):
        raise NotImplementedError("Subclasses should implement this!")

    def list_entities(self):
        raise NotImplementedError("Subclasses should implement this!")


class File(FileSystemEntity):
    def __init__(self, name, size):
        super().__init__(name)
        self.size = size

    def get_size(self):
        return self.size

    def list_entities(self):
        return [self.name]


class Directory(FileSystemEntity):
    def __init__(self, name):
        super().__init__(name)
        self.contents = []

    def add_entity(self, entity):
        self.contents.append(entity)

    def get_size(self):
        total_size = 0
        for entity in self.contents:
            total_size += entity.get_size()
        return total_size

    def list_entities(self):
        entities = []
        for entity in self.contents:
            entities.extend(entity.list_entities())
        return entities



root = Directory("root")
home = Directory("home")
user = Directory("user")

file1 = File("file1.txt", 1200)
file2 = File("file2.txt", 2300)

user.add_entity(file1)
user.add_entity(file2)
home.add_entity(user)
root.add_entity(home)

print("Total size of 'root' directory:", root.get_size())  # Output: 3500
print("Entities in 'root' directory:", root.list_entities())  # Output: ['file1.txt', 'file2.txt']
