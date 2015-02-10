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
        public static List<ProjectList> GetProjectListItems()
        {
            using (var context = new RSFFireEntities())
            {

                var result = context.Database
                    .SqlQuery<ProjectList>("usp_ProjectListSelect")
                    .ToList();
                return result;
            }
        }
    }
}
