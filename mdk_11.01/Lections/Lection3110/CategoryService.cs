using Microsoft.EntityFrameworkCore;

namespace Lection3110
{
    public class CategoryService
    {
        public async Task<List<Category>> GetCategoriesAsync()
        {
            using var context = new AppDbContext();
            return await context.Categories.ToListAsync();
        }

        public async Task AddCategoryAsync(Category category)
        {
            using var context = new AppDbContext();
            context.Categories.Add(category);
            await context.SaveChangesAsync();
        }

        public async Task DeleteCategoryAsync(int id)
        {
            using var context = new AppDbContext();
            var category = await context.Categories.FindAsync(id);
            if (category != null)
            {
                context.Categories.Remove(category);
                await context.SaveChangesAsync();
            }
        }

        public async Task UpdateCategoryAsync(Category category, int id)
        {
            using var context = new AppDbContext();
            var currentCategory = await context.Categories.FindAsync(id);
            if (currentCategory != null)
            {
                currentCategory.Name = category.Name;
                await context.SaveChangesAsync();
            }
        }
    }
}
