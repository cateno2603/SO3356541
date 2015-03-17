namespace WindowsFormsApplication7
{
    using System.ComponentModel.DataAnnotations;

    public partial class Employee_Car
    {
        public int employee_CarId { get; set; }

        public int employeeID { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public virtual Employee Employee { get; set; }
    }
}
