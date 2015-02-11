using RSFFireBiz;
using RSFFireData.Models;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace RSFFire
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public List<Project> GetProjects(int startRowIndex, int maximumRows, out int totalRowCount)
        {
            return RsfFireBusinessLogic.GetProjectListItems(startRowIndex, maximumRows, out totalRowCount);

        }
    }
}