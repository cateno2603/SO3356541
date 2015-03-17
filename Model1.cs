namespace WindowsFormsApplication7
{
    using System.Data.Entity;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=MyModel")
        {
            Configuration.LazyLoadingEnabled = false;
        }

        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Employee_Car> Employee_Car { get; set; }
        public virtual DbSet<Employee_Country> Employee_Country { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
