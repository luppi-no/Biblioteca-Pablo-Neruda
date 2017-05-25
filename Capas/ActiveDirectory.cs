using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;
using System.Collections;
using System.Data;

/// <summary>
/// Hecho por Carlos Sanson Abugoch.
/// </summary>
public class ActiveDirectory
{
    #region Propiedades Privadas

    private string sInternalDomain = Common.GetAppSetting("InternalDomain");
    private string sPathDomain = Common.GetAppSetting("PathDomain");
    private string sUsuarioAD = Common.GetAppSetting("UsuarioAdmin");
    private string sPasswordAD = Common.GetAppSetting("PasswordAdmin");

    #endregion

    #region Métodos de Validación

    /// <summary>
    /// Valida el nombre de usuario y contraseña para un usuario dado
    /// </summary>
    /// <param name="sUserName">El nombre de usuario a validar</param>
    /// <param name="sPassword">La contraseña del usuario a validar</param>
    /// <returns>
    /// Retorna True si el usuario es válido
    /// </returns>
    public bool ValidateCredentials(string sUserName, string sPassword)
    {
        PrincipalContext oPrincipalContext = GetPrincipalContext();
        return oPrincipalContext.ValidateCredentials(sUserName, sPassword);
    }

    /// <summary>
    /// Valida si el usuario existe en el AD
    /// </summary>
    /// <param name="sUserName">El nombre de usuario a validar</param>
    /// <returns>
    /// Retorna true si el usuario existe
    /// </returns>
    public bool IsUserExisting(string sUserName)
    {
        if (GetUser(sUserName) == null)
        {
            return false;
        }
        else
        {
            return true;
        }
    }

    
    #endregion

    #region Métodos de búsqueda

    /// <summary>
    /// Obtiene determinado usuario del AD
    /// </summary>
    /// <param name="sUserName">El nombre de usuario a obtener</param>
    /// <returns>
    /// Retorna el objeto UserPrincipal
    /// </returns>
    public UserPrincipal GetUser(string sUserName)
    {
        PrincipalContext oPrincipalContext = GetPrincipalContext();

        UserPrincipal oUserPrincipal =
           UserPrincipal.FindByIdentity(oPrincipalContext, sUserName);
        return oUserPrincipal;
    }

    /// <summary>
    /// Obtiene determinado grupo del AD
    /// </summary>
    /// <param name="sGroupName">El grupo a obtener</param>
    /// <returns>
    /// Retorna el objeto GroupPrincipal
    /// </returns>
    public GroupPrincipal GetGroup(string sGroupName)
    {
        PrincipalContext oPrincipalContext = GetPrincipalContext();

        GroupPrincipal oGroupPrincipal =
           GroupPrincipal.FindByIdentity(oPrincipalContext, sGroupName);
        return oGroupPrincipal;
    }

    public string GetUserPropertyByObjectGuid(string sObjectGuid, string sPropertyName)
    {
        string sMess = "";
        string result = "";
        try
        {
            PrincipalContext oPrincipalContext = GetPrincipalContext();
            Principal principal = Principal.FindByIdentity(oPrincipalContext, IdentityType.Guid, sObjectGuid);
            DirectoryEntry directoryEntry = (DirectoryEntry)principal.GetUnderlyingObject();

            int iTotal = directoryEntry.Properties[sPropertyName].Count;

            if (iTotal == 1)
            {
                result = directoryEntry.Properties[sPropertyName].Value.ToString();
            }
            else if (iTotal > 1)
            {
                for (int iValue = 0; iValue < iTotal; iValue++)
                {
                    if ((iValue + 1) == iTotal)//si es la ultima iteracion no se agrega el delimitador
                    {
                        result += directoryEntry.Properties[sPropertyName][iValue].ToString();
                    }
                    else
                    {
                        result += directoryEntry.Properties[sPropertyName][iValue].ToString() + ";";
                    }
                }
            }
            return result;
        }
        catch (Exception ex)
        {
            sMess = "Error: \n" + ex.Message;
            return null;
        }
    }

    #endregion

    #region Group Methods

    /// <summary>
    /// Verifica que un usuario pertenezca a un grupo
    /// </summary>
    /// <param name="sUserName">El nombre de usuario a validar</param>
    /// <param name="sGroupName">EL nombre del grupo para el cual se desae validad la
    /// pertenencia del usuario</param>
    /// <returns>
    /// Retorna true si el usuario pertenece al grupo
    /// </returns>
    public bool IsUserGroupMember(string sUserName, string sGroupName)
    {
        UserPrincipal oUserPrincipal = GetUser(sUserName);
        GroupPrincipal oGroupPrincipal = GetGroup(sGroupName);

        if (oUserPrincipal != null && oGroupPrincipal != null)
        {
            return oGroupPrincipal.Members.Contains(oUserPrincipal);
        }
        else
        {
            return false;
        }
    }

    #endregion

    #region Helper Methods

    /// <summary>
    /// Obtiene el contexto principal
    /// </summary>
    /// <returns>
    /// Retorna el objeto PrincipalContext
    /// </returns>
    public PrincipalContext GetPrincipalContext()
    {
        PrincipalContext oPrincipalContext = new PrincipalContext(ContextType.Domain, sInternalDomain, sUsuarioAD, sPasswordAD);
        return oPrincipalContext;
    }

    #endregion
}