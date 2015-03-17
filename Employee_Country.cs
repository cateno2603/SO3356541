namespace WindowsFormsApplication7
{
    using System.ComponentModel.DataAnnotations;

    public partial class Employee_Country
    {
        public int Employee_CountryId { get; set; }

        public int employeeID { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public virtual Employee Employee { get; set; }
    }
}
