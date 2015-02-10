using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RSFFireData;
using RSFFireData.Models;

namespace RSFFireBiz
{
    public class RsfFireBusinessLogic
    {
        public static List<Project> GetProjectListItems(int startRowIndex, 
                        int maximumRows, out int totalRowCount)
        {
            using (var ctx = new RSFFireEntities())
            {
                totalRowCount = ctx.Projects.Count();
                return ctx.Projects.ToList();
            }
        }
    }
}
