#Area Calculator
import math

def Calculate_area(shape, dimensions):
    # Convert shape to lower case to handle case-insensitive input
    shape = shape.lower()
    
    # Calculate the area based on the shape
    if shape == 'rectangle':
        # Ensure dimensions is a tuple or list with two elements (length, width)
        if isinstance(dimensions, (tuple, list)) and len(dimensions) == 2:
            length, width = dimensions
            area = length * width
        else:
            raise ValueError("Dimensions for a rectangle should be a tuple or list with two elements (length, width).")
    elif shape == 'circle':
        # Ensure dimensions is a single value (radius)
        if isinstance(dimensions, (int, float)):
            radius = dimensions
            area = math.pi * (radius ** 2)
        else:
            raise ValueError("Dimensions for a circle should be a single value (radius).")
    else:
        raise ValueError("Unsupported shape. Supported shapes are: 'rectangle', 'circle'.")
    
    return area

# Example usage
rectangle_area = Calculate_area('rectangle', (10, 5))
circle_area = Calculate_area('circle', 7)

print(f"Rectangle area: {rectangle_area}")
print(f"Circle area: {circle_area}")
