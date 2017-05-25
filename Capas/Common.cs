using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Management;
using System.Security;
using System.Collections.ObjectModel;
using System.Globalization;

public class Common
{
    #region Métodos de Validación de CL_RUN

    /// <summary>
    /// Valida DV de un CL_RUN
    /// </summary>
    /// <param name="iNumber">Número del CL_RUN</param>
    /// <param name="sDV">Dígito verificador CL_RUN</param>
    /// <returns>
    /// Retorna True si el CL_RUN es válido
    /// </returns>
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

    #endregion

    #region Métodos Privados Archivos de Configuración

    /// <summary>
    /// Obtiene un valor de la sección AppSettings del archivo de configuración dada una
    /// llave
    /// </summary>
    /// <param name="pKey">Llave de busqueda en el AppSettings</param>
    /// <returns>
    /// Retorna el valor de una llave de la sección AppSettings del archivo de
    /// configuración
    /// </returns>
    public static string GetAppSetting(string pKey)
    {
        string sRet = string.Empty;
        try
        {
            sRet = ConfigurationManager.AppSettings.Get(pKey);
        }
        catch
        {
            sRet = "";
        }
        return sRet;
    }
    #endregion

    #region Métodos de Validacion/Formato de Strings y Enteros

    /// <summary>
    /// 
    /// </summary>
    /// <param name="Num"></param>
    /// <returns></returns>
    public static bool ValidateNum(int Num)
    {
        bool iResult = false;
        string sNum = Num.ToString().Trim();
        bool isNum = int.TryParse(sNum, out Num);
        int nLength = sNum.Length;
        
        if (isNum)
        {
            iResult = true;
        }
        else
        {
            iResult = false;
        }
        return iResult;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sStringToFormat"></param>
    /// <returns></returns>
    public static bool ValidateString(string sStringToFormat)
    {
        string s = sStringToFormat;
        bool iResult = false;
        if (s == null || s == "" || s == String.Empty)
        {
            iResult = false;
        }
        else
        {
            iResult = true;
        }
        return iResult;
    }

    //public static bool FormatString()
    //{

    //}

    public static string RemoveDiacritics(string text)
    {
        var normalizedString = text.Normalize(NormalizationForm.FormD);
        var stringBuilder = new StringBuilder();

        foreach (var c in normalizedString)
        {
            var unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
            if (unicodeCategory != UnicodeCategory.NonSpacingMark)
            {
                stringBuilder.Append(c);
            }
        }
        return stringBuilder.ToString().Normalize(NormalizationForm.FormC);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="Num"></param>
    /// <param name="iMin"></param>
    /// <param name="iMax"></param>
    /// <returns></returns>
    public static bool ValidateLength(int Num, int iMin, int iMax)
    {
        bool iResult = false;
        string sNum = Num.ToString().Trim();
        int nLength = sNum.Length;
        if (nLength >= iMin && nLength <= iMax)
        {
            iResult = true;
        }
        else
        {
            iResult = false;
        }
        return iResult;
    }

    /// <summary>
    ///  Formatea un string dejando la primera letra de cada palabra en mayusculas
    /// </summary>
    /// <param name="value">String de entrada</param>
    /// <returns>
    /// Retorna el string con cada palabra con la primera letra mayúscula
    /// </returns>
    public static string UppercaseWords(string value)
    {
        char[] array = value.ToCharArray();
        // Handle the first letter in the string.
        if (array.Length >= 1)
        {
            if (char.IsLower(array[0]))
            {
                array[0] = char.ToUpper(array[0]);
            }
        }
        // Scan through the letters, checking for spaces.
        // ... Uppercase the lowercase letters following spaces.
        for (int i = 1; i < array.Length; i++)
        {
            if (array[i - 1] == ' ')
            {
                if (char.IsLower(array[i]))
                {
                    array[i] = char.ToUpper(array[i]);
                }
            }
        }
        return new string(array);
    }

    #endregion
}
