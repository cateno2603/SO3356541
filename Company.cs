namespace WindowsFormsApplication7
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Company")]
    public partial class Company
    {
        public int companyID { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
    }
}
