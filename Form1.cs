using System;
using System.Diagnostics;
using System.Linq;
using System.Windows.Forms;
using System.Data.Entity;

namespace WindowsFormsApplication7
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var companyID = 2;
            Company company;
            using (var context = new Model1())
            {
                company = context.Companies
                         .AsNoTracking()
                         .Include(co => co.Employees.Select(emp => emp.Employee_Car))
                         .Include(co => co.Employees.Select(emp => emp.Employee_Country))
                         .FirstOrDefault(co => co.companyID == companyID);
            }
            Debug.Assert(company != null);
            var cars = company.Employees.SelectMany(emp => emp.Employee_Car);
            Debug.Assert(cars.Count() == 3);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var companyID = 2;
            Company company;
            using (var context = new Model1())
            {
                company = context.Companies
                         // .AsNoTracking() Boom!
                         .Include(co =>
                             co.Employees
                                .Select(emp => emp.Employee_Car
                                    .Select(ec => ec.Employee)
                                    .Select(emp2 => emp2.Employee_Country)))
                         .FirstOrDefault(co => co.companyID == companyID);
            }
            Debug.Assert(company != null);
            var cars = company.Employees.SelectMany(emp => emp.Employee_Car);
            Debug.Assert(cars.Count() == 3);
        }
    }
}
