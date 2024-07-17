import tkinter as tk

class PixelCanvas:
    def __init__(self, root):
        self.root = root
        self.root.title("32x32 Pixel Canvas")
        
        self.grid_size = 32  # Grid size (32x32)
        
        self.canvas = tk.Canvas(root, bg='white')
        self.canvas.pack(fill=tk.BOTH, expand=True)
        
        self.pixel_array = [0] * (self.grid_size * self.grid_size)
        self.rectangles = []
        
        self.canvas.bind("<Button-1>", self.place_pixel)
        self.canvas.bind("<B1-Motion>", self.place_pixel)
        self.canvas.bind("<Button-3>", self.remove_pixel)
        self.canvas.bind("<B3-Motion>", self.remove_pixel)
        self.canvas.bind("<Configure>", self.on_resize)
        
        self.root.protocol("WM_DELETE_WINDOW", self.on_closing)
        
        self.draw_grid()
    
    def draw_grid(self):
        self.canvas.delete("all")
        self.rectangles = []
        self.cell_size_x = self.canvas.winfo_width() / self.grid_size
        self.cell_size_y = self.canvas.winfo_height() / self.grid_size
        
        for i in range(self.grid_size):
            row = []
            for j in range(self.grid_size):
                rect = self.canvas.create_rectangle(
                    i * self.cell_size_x,
                    j * self.cell_size_y,
                    (i + 1) * self.cell_size_x,
                    (j + 1) * self.cell_size_y,
                    outline='gray',
                    fill='black' if self.pixel_array[j * self.grid_size + i] else 'white'
                )
                row.append(rect)
            self.rectangles.append(row)
    
    def place_pixel(self, event):
        x, y = event.x, event.y
        grid_x, grid_y = int(x // self.cell_size_x), int(y // self.cell_size_y)
        
        # Ensure the click is within bounds
        if 0 <= grid_x < self.grid_size and 0 <= grid_y < self.grid_size:
            index = grid_y * self.grid_size + grid_x
            self.canvas.itemconfig(self.rectangles[grid_x][grid_y], fill='black')
            self.pixel_array[index] = 1
    
    def remove_pixel(self, event):
        x, y = event.x, event.y
        grid_x, grid_y = int(x // self.cell_size_x), int(y // self.cell_size_y)
        
        # Ensure the click is within bounds
        if 0 <= grid_x < self.grid_size and 0 <= grid_y < self.grid_size:
            index = grid_y * self.grid_size + grid_x
            self.canvas.itemconfig(self.rectangles[grid_x][grid_y], fill='white')
            self.pixel_array[index] = 0
    
    def on_resize(self, event):
        self.draw_grid()
    
    def on_closing(self):
        # Translate pixel array to MIPS assembly code
        assembly_code = ""
        for i in range(self.grid_size):
            for j in range(self.grid_size):
                if self.pixel_array[j * self.grid_size + i]:
                    assembly_code += f"\tsw $t1, {4 * (j * self.grid_size + i)}($sp)\n"

        # Write assembly code to file
        with open("GoLCanvas.txt", "w") as f:
            f.write(assembly_code)
                
        self.root.destroy()

if __name__ == "__main__":
    root = tk.Tk()
    app = PixelCanvas(root)
    root.mainloop()
