using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Proyecto.Capas
{
    class Common
    {
        public static bool ValidateCL_RUN(int iNumber, string sDV)
        {
            if (sDV == CalculateCL_RUN_DV(iNumber))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Calcula dígito verficador (DV) de un CL_RUN
        /// </summary>
        /// <param name="iNumber">Número del CL_RUN</param>
        /// <returns>
        /// Retorna Dígito Verficador del número dado
        /// </returns>
        private static string CalculateCL_RUN_DV(int iNumber)
        {
            string sNumber = iNumber.ToString();
            int calc = 0;

            int[] fact = { 3, 2, 7, 6, 5, 4, 3, 2 };
            int iFact = fact.Length - 1;

            for (int i = sNumber.Length - 1; i >= 0; i--)
            {
                calc += (fact[iFact] * int.Parse(sNumber.Substring(i, 1)));
                iFact--;
            }

            string sDV;
            int resultado = 11 - (calc % 11);

            if (resultado == 11)
            {
                sDV = "0";
            }
            else if (resultado == 10)
            {
                sDV = "K";
            }
            else
            {
                sDV = resultado.ToString();
            }

            return sDV;
        }
    }
}
