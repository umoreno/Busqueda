using System.Linq;
using System.Data.Linq.Mapping;
using System;

[Table(Name = "Users")]
public class Users
{
    [Column(IsPrimaryKey = true)]
    public string CustomerID;
    [Column]
    public string Company;
    [Column]
    public string Nombre;
    [Column]
    public string ApPaterno;
    [Column]
    public string ApMaterno;
    [Column]
    public DateTime FechaNacimiento;
    [Column]
    public string Direccion;
    [Column]
    public string Colonia;
    [Column]
    public string Municipio;
    [Column]
    public string Estado;
    [Column]
    public string CodigoPostal;
    [Column]
    public string TelFijo;
    [Column]
    public string TelExtension;
    [Column]
    public string TelMovil;
    [Column]
    public string RoleId;
}

