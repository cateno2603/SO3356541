namespace WindowsFormsApplication7
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Employee")]
    public partial class Employee
    {
        public Employee()
        {
            Employee_Car = new HashSet<Employee_Car>();
            Employee_Country = new HashSet<Employee_Country>();
        }

        public int employeeID { get; set; }
        public int companyId { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public virtual ICollection<Employee_Car> Employee_Car { get; set; }
        public virtual ICollection<Employee_Country> Employee_Country { get; set; }
        public virtual Company Company { get; set; }
    }
}
