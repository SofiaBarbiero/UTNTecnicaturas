using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTNtecnicaturas.Dominio
{
    internal class SituacionHabitacional
    {
        public int IdSituacionHab { get; set; }
        public string SituacionHab { get; set; }

        public SituacionHabitacional()
        {
            IdSituacionHab = 0;
            SituacionHab ="";
        }
        public SituacionHabitacional(int id, string tip)
        {
            IdSituacionHab = id;
            SituacionHab =tip;
        }
    }
}
