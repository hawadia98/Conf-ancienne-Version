using System;
using System.Linq;
using Microsoft.Extensions.Logging;
using Usercube.Expressions.Functions;
using Entities;

#nullable enable

[assembly: System.Reflection.AssemblyTitle("Expressions")]
[assembly: System.Reflection.AssemblyCompany("Usercube")]
[assembly: System.Reflection.AssemblyProduct("Usercube")]
[assembly: System.Reflection.AssemblyCopyright("Copyright © Usercube 2018")]
[assembly: System.Reflection.AssemblyVersion("1.0.0.0")]
[assembly: System.Reflection.AssemblyFileVersion("1.0.0.0")]

public static class ExpressionFF028B21348FDC99E3231C1409DB1CC93AE92BA40B8F29FA925A0767109BB9C0
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return !resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)).HasValue ? "9223372036854775807" : resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)).Value.AddHours(-5).ToSince1601DateString();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673090L)) };
}
public static class Expression3C32DFD689B3A219CB440A33F8A873F6D5DBCEB83A7B8D5C04BA25787AE0C466
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant()))+ "." + ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression5E3FC5F7139B827C3EB62B94B4E71F7D8D0A50AFC5B11039A0B447EFF9DE8D33
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673108L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673108L)), new Usercube.Data.Api.Entities.PropertyKey(8589934734L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673108L)), new Usercube.Data.Api.Entities.PropertyKey(8589934734L)).Split('/') == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673108L)), new Usercube.Data.Api.Entities.PropertyKey(8589934734L)).Split('/')[0])));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673108L), new Usercube.Data.Api.Entities.PropertyKey(8589934734L)) };
}
public static class ExpressionA96A041CADCEAC6F0DF3056D79CC311904D36508423EEEF649D2A3CBBE864DB2
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))+ " " + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class Expression08CEFB8AD702E9C40CF24C49466CC73FABA64BDC47298A6432D23FBA22A4DA4B
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<bool?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673120L)).GetValueOrDefault() ? "514" : "512";}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673120L)) };
}
public static class ExpressionA7B26DA11A20C2622514BA9EEE448BC4C4653C221D452A9263D9441C9705A0D6
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "ARCS_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression8928C9249521154871A407A66DAB5F60DC9DA391AE6DCBD91C0AFBFADAEB89FB
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "ARSAT_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression785838CD4CCAEF6DA6D846CF733818EE458AD014E81B2CBFAE73CA5EA2CB16BC
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "ARTEFIS_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression66EC68334C8E40DA21E23A4DC0AA1BB4EF8F075865FDEACF27494584C9AA08A1
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "ASSTECQ_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionD883171D4DCB2B551799D4E8832791B51CFBF4EDC5387915E63B8609E6988FFA
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Abel Entreprise_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression36035D461BF59C983DE814F53C3875D53BD80914B4028203C0747F2D3430CAFB
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Accès aux locaux_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression06FEFDF2B747835ED0E88753988319FFB9D201C2050F69358B3C153BEBBCA09B
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Administration infrastructures_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression0E141C2D1E8CE93CBC7E0A1269FD77A76FC05CF27C890E24753A812652815255
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Administration locale Poste de travail_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionEC4B58894002F757FF97A25871E9452E979F813261E4FE8F41194FBFAB18305F
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Algosec_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression426926D699F742052D266F099414716A5D4B5749648FB13A739EFDD10CE0955C
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Alpaga_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionE0E505442E87697FCC01C9045081EFD3956D3E66D191A0621A766E285405A06C
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "AlpagaPortailCR_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression0B1C5BC4B7FEC2661E4E77ECA4B2CBCA971A535195CFF23DCF5172655DAFDC24
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Annuaire intranet_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression06773D7216F570F1ABD5002DFDDEC2B42AB42070A806D32C91B5E563CDD682B2
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Argus Cold_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression37F3F73CB2A7A602A85B402626EDB7CBE05B195F3B04CD62FDEFEB74684D2FC4
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Assuretat_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression594E078BEE6FD25BE1B3256AC1B7A008138401B18D2573F4690382C1055F63F4
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "BDOC Design_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionE8CDDC73D50AE293CC4CC401B11BDAB511725FA9841937196C143F6BEEA9DFA8
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "BigDataAssurance-Production_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionE0333EFACD8659BAB99012A98307B78E9FF627E461151E1F1109F722BAE38175
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "CARISMA_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression100DFE326F465C27C020544833DC3371C4B4F0405A617644A702C767DFAD1EDF
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "CASIRIS_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression7AA4BD835AD5F23773E1CD85F9BA57F84BBC7DA551361C742A623A2751B990FC
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "CLASSIFIER_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression1B44C211EDFDC38A9CD7CCA85478BD8944B2A7A14FE5C0E333A6B08A0ACDA323
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "CLIPEX_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionFC00076A9AC19D888683107AC3DBC9745A6D475CA6E1FF282169762121D38FBC
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "CMS Opentrust Badge_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression0B471B043C46EDB16079C5C71D05B0C2AD27A989961E7BEFCB58766D5CD68F7E
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "CUCM_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression37BBA31E9A5FBB3E8E82BDBA9A86D9C0089DA153454AFB3E54DC06B136E6395C
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Confluence_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression95948B0652D73978C36383963871638B360DC612FB62D642131F74F8B321EA14
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Console WAS RCI_RCU_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionC2B888F1067D346EABDAD58DED6E8DEE504534D6037F39F9ED8DE2984213FE56
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Customsweb_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression73E39C0D5BBDEFF2CC5A111673CB101446CAEEB229CBA29DC031FD0A9C785915
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "DAS2_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression0A753CE57ACA7345869C451F57243434D4A95A688E3DB91DCEC19DCE7B4E5343
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "DDE_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionEF0D3B43A8FCA802227A17094C8CFBF6AB09DA75BB318208F955F5AA155A7462
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "DIAPASON Production_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression85AB293AB4C7FE5B4EB0953DED01C0492232ADE095400A8F0F6265CE06DFC429
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "DIAPASON Recette_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression7FEFAF1812DD718B9A3680436217BCBBEA8D2A3DDEF377855A282E38D9463336
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Demande d'intervention_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionDFD86354E795387D5864A8466CFF50FFD02C01E6F3D31347D0480B152E15538B
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Décisionnel - Infocentre_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression4AD2C75B4A5DCB16D492E7A8137C9002FA26C78AA6963880DDFCEF042787E743
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Décisionnel - QlikView_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionDE606C977A3C853D5C1D7949EFA37C7AF2CB5DD01592FAD66ACB6BD8C986026A
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "EASY_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression7C56D226D023BBF1C7C2AAE1CCBB845B70838DAAF13001EAEC9A2825DFC87CAF
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "EMBLEM_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionB4270D0AE82F31A6BD995A034995D8438C9F801ECE450722B28A91812A179EA9
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "ESTO_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionE4CCC9415D0C7F0F84CC78E344524F293440387F951C795BB0C4F11459426D8E
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Encadrement UGS_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression68D578727EC32B725EA8B2BED36C33294E68426E26C54F012EE076CACF90E709
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Etat de perte (EDP)_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression461056DD5E39274483208B6F8EFD8DD02D3FE8183ABFAD5EC524622C98938711
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Evolan Designer_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionDFBAEFC0FF815E927C25B38C2608365C98156F4D12731F3790B3415A39458521
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Evolan Postal Mail_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionB7ECD5F2F781F84651FC593091213789537D5485A945026D6DE4E45B9EF685E3
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "FCCS_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression4F881DD54BCD1585610E6033E7F58D721EA5F53BFE285303BBAF04C525F5FE90
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Filezilla Server VIAVITA_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionF03C7232E724800B6CFBED276A81ABDCF0A1E4DE1F5172732BD9D7F8AA23E9C9
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Formliasse_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionCBD61742E3D1ECC26A55B19D2EFE47710367884DB1EA5538FC94949302281D1F
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "GED_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionA5837C89F0A29DE47A9E16BB6978F0C27B13ECD87C58A5A2DB2E36BF26C86EDD
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "GENESYS_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression8EE904F4B3A20E985C9D343BA7F3D656302E507B1F4B0BC7C4D066B6680356C8
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888199L))?? resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888203L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888199L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888203L)) };
}
public static class Expression5B2B553B74BBD0CF9DBF8FD510830EA8A0E7AE016F416CAEC179353A07551C7D
{
public static System.DateTime? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
if (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855508L))== "Sortie externe" || resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855508L))== "Mobilite groupe" || resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855508L))== "Depart a la retraite") {
  if (string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855498L))))
  {
    return null;
  }

  var contractEndDate = Usercube.Expressions.Functions.UtilExpressions.ParseLocalDate(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855498L)), null, "yyyy-MM-dd");
  return contractEndDate.ToUniversalTime().AddMinutes(1440);
}

return null;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(150323855508L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(150323855498L)) };
}
public static class Expression957B481D71468707537BA07638117ACBE7DAE58301B6257FC5114529CDC4B319
{
public static System.DateTime? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
if (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855508L))== "Sortie externe" || resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855508L))== "Mobilite groupe" || resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855508L))== "Depart a la retraite") {
  if (string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855498L))))
  {
    return null;
  }

  var positionEndDate = Usercube.Expressions.Functions.UtilExpressions.ParseLocalDate(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855498L)), null, "yyyy-MM-dd");
  return positionEndDate.ToUniversalTime().AddMinutes(1440);
}

return null;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(150323855508L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(150323855498L)) };
}
public static class Expression55F877F9B996DFD66881390FC5C8ED015E8F4A35E7A5ADB6B0FB53ABB4FD2B92
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Hermes_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression6D7BB6EE8893C0C013964282D76D758C9D3DE0887ABCAE2ACFB0593F27B75366
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "IRCA_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression0E5F5043D49701A99BB0FFE44E299553A0DFAF55EDBA96F490269DE70B10533F
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "ITESOFT_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression64FBA24F46F55309F9D7F395B9A836E7E425EB724CE8393945F839B93F9ACCDE
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Imprimantes_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression7A77CFE170B3B31CF1F8B433EAB06E38C00DE25F869008709EC9FDC8D45D5C8E
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "JENKINS_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression515311BB05BC67E1F3BE64727CE749C377257392AB55FC188F04F59A863B44FF
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "KEYCLOAK_IDP_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression640E5B58EC14690E18E3C5E7B7B5B4B3DCDEBBD7361CFF63409E7E5B878D8266
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "MANTIS Excilys_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionCE9518A67DAE0D9B21640F9F3C4A7F9E57D789892A1192E3687A8B50AD573825
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "MEGA_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionF55F9D55F4A439579A18A3072D99AC179E4CA0E5E29FC431E629D45D6970416E
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Microsoft Dynamics CRM_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionB425A1463A3CDC4765B6A04B17D6F057C8C9C507FF794D5AE5F87CD9CB61545A
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Mon empreinte digital_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionCECA17CD50A189C3342E5D44FD06F2036EA2E3E10C20389E9415A0EC258B3F40
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "MyJobs_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression87BD491898DDB47355D845E16280CF2052D2B96611334022AE9CDE459C237751
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "OCEAN_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionF2220467D0B3F0B572C6AA14C48E10810E865B96BBC56050E1F37BBC93703716
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Oracle Answers_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionF1F7E6EC3FD62D5226D659B75E6A27BF899B2A645FFAC1AA7A1E1A784998E4BD
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "PILOT_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression2668423CC1367441390325C8F41489453D4F3760FD3382EBF562980A4ACCD72F
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "PKI Carioca_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression6A3F1655B982F2BC74D218D43BFA68430B74AEAEDFD1325858735229F790DB13
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Pacifica Active Directory SIA - CyberArk_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression4137708052C8C0D5AB6D491A4DF188C29387D47ED424E452F79163EFA69435A7
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Pivotal VIAVITA_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression98E81E94C80571BB3D65FA4794A208648ED45DEA8B1840ACE0C56CD045246C46
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Quality Center_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionFFB6D3E73D4161411BEAEEF14BD6A11655FAD8835AA26C10226AEEBFC37B89B2
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "RCP Scope_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionBC9B5929C8073D628D39A00BC532F50EA33D646AD1F79B0BEF82C7AE0955D167
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Remetrica_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionB52206023A4C6C259B789C9FF47BF4257124677D098C3F8114496EA45B1623BB
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "ResQ_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionD9E04427DBB6900442A7470F8070502B8AD3A02C492527A050AAE4987A697EE4
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Réclamations_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression9552CAB62069F6230846A7305140F032239451A979A8667E4B538FA4F70E21B2
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "SAS Console_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression9E23A188D9DCD7ABE616723381B1329C5741F6E69C9E693FF8EB6D9F4E26B118
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "SAS Guide_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression868ABE4CBEDB5295477247549747551962132661B92CAF4738FC474E5F9F6850
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "SBC_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionC773178909596A5E559F42EE1186F64B99A4AAD3746D4859CD2F2FE84F734D85
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "SEP_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression9DB727D130B705EC335BE15090684E7250151D278428FF25E5638DF085C270B6
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "SONAR_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression1E08AA85785CDCA99AC4D01425BEF49CCEAAE7B45E76B3459D0658837A539F86
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "SUD2_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression742EF18A94980CB210AA38052DA7AE1388C6BE3B2749BFF45EBD73A28EDA27ED
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "SVI_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression3E8A1D2D1AAAA1288553A59C104E58A52D325F16BD0A9E05401C26459ABBD28A
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "SVN_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionABBF5E5D2717C16B477A48AB27AD6FDD0CCE351FD3599620DA3911F6D5B5F6E6
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "SentinelOne_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression0C0F5377FE482FF584EF88114D08C2D1470AAA9F6F050DF13AE49D80E9A4DDE1
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Sightcall_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionE220DFEAEE01197F6083B1D88B39C2408614462350636181D1F00E6EFD4D753B
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Sésame Formation_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression6AC490721CE66D4B5649B45E8B1275D325CB511390D82CF7CB9F5972BE0E19F7
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Sésame Production_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionC24ECB5AF7D7469352EBF2BC70BB5D2B393B742409D3BE8524527517557DED40
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "TFS_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression62732A6539CF8E2C8F07D42013EC9E7F74A863433903763F751EC479006030FB
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Tableau de répartition (TDR)_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression5EE9D07E20B7772F61301C6C6D3DB25A112FE9DA770FE41315E2BF25E6F46089
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Tenable_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class ExpressionC2C12FF26BCDDDAC7215E9528285599A3E6CB61110AC77941EAA82AFA029AED4
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Triskell_" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)) };
}
public static class Expression394A4485F16710A68B5D1BB290A308FDF4811239FD4292F4CC53BDA3020ADEA6
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToUpperInvariant()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression21EE3CFACB262CC203E65170EC98D5DB508F6BB045FBD4E23C2E25AF22F89600
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))+ " " + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class ExpressionFA6DFD881B8DCFC1DA3D658D55A699599161D5D2AA94D6FB48B934A75A3A131B
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression8046950759E8B0504F2B10654CD970AC980A0EE9F20F31CD99469F7BC3BFB350
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class ExpressionE28A4DFA3460777D81A6C24D46F1D102E8CD435EBE9B3E92574A733324B43482
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression61349A383CF1D9EC835EBE897A0B9F5ED38D475677DE4C7B9FF5E8406EAADE7F
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant()))+ " " + ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class ExpressionADBFE919EF2F631A4C6F211DA8BBFFB87F69DF1B9ABD2905E292C75740CB6E6D
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resolver.GetValue<string?>("value").Approximate();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() {  };
}
public static class Expression4017D82EF3FB962FE5EF7EAF0DBF050EEE58840F9F02B6B54A2925EBDB95571E
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return (resourceAdapter.GetEntity(resolver.GetValue<object>("organization"), new Usercube.Data.Api.Entities.PropertyKey(8589934727L))== null ? null : (resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("organization"), new Usercube.Data.Api.Entities.PropertyKey(8589934727L)), new Usercube.Data.Api.Entities.PropertyKey(8589934724L))+ " / ")) + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("organization"), new Usercube.Data.Api.Entities.PropertyKey(8589934723L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(8589934727L), new Usercube.Data.Api.Entities.PropertyKey(8589934724L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(8589934723L)) };
}
public static class Expression6D189FA5D6A2B6FC265E73950191328AF4CF8B73193F4637F47DB3D9CACD091D
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetEntity(resolver.GetValue<object>("region"), new Usercube.Data.Api.Entities.PropertyKey(21474836609L))== null ? resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("region"), new Usercube.Data.Api.Entities.PropertyKey(21474836610L)): (resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("region"), new Usercube.Data.Api.Entities.PropertyKey(21474836609L)), new Usercube.Data.Api.Entities.PropertyKey(4294967425L))+ " / " + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("region"), new Usercube.Data.Api.Entities.PropertyKey(21474836610L)));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(21474836610L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(21474836609L), new Usercube.Data.Api.Entities.PropertyKey(4294967425L)) };
}
public static class Expression39A52E68E95B8EF4209DA5275471CCA7149DD7E768A26085D5A8273F0F75C7DC
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
var path = string.Empty;
if (resourceAdapter.GetEntity(resolver.GetValue<object>("site"), new Usercube.Data.Api.Entities.PropertyKey(25769803917L))!= null)
{
  if (resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("site"), new Usercube.Data.Api.Entities.PropertyKey(25769803917L)), new Usercube.Data.Api.Entities.PropertyKey(21474836609L))!= null)
  {
    path = resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("site"), new Usercube.Data.Api.Entities.PropertyKey(25769803917L)), new Usercube.Data.Api.Entities.PropertyKey(21474836609L)), new Usercube.Data.Api.Entities.PropertyKey(4294967425L))+ " / ";
  }

  path += resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("site"), new Usercube.Data.Api.Entities.PropertyKey(25769803917L)), new Usercube.Data.Api.Entities.PropertyKey(21474836610L))+ " / ";
}

path += resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("site"), new Usercube.Data.Api.Entities.PropertyKey(25769803906L));
return path;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(25769803917L), new Usercube.Data.Api.Entities.PropertyKey(21474836609L), new Usercube.Data.Api.Entities.PropertyKey(4294967425L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(25769803917L), new Usercube.Data.Api.Entities.PropertyKey(21474836610L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(25769803906L)) };
}
public static class Expression61B8EBAE2B73B0F5F2A9FEF82CA0AA1DE5BBBDF02BCCD4778A7DD678E6FBCDB9
{
public static long? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
long? managerId = null;
managerId = ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673099L))== null) ? null : resourceAdapter.GetProperty<long?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673099L)), new Usercube.Data.Api.Entities.PropertyKey(34359738368L)));
if (managerId != default)
{
  /* There is an explicit IGA Manager */
  return managerId;
}
managerId = ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L))== null) ? null : resourceAdapter.GetProperty<long?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738368L)));
if (managerId != default && ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673122L))== null) ? null : resourceAdapter.GetProperty<long?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673122L)), new Usercube.Data.Api.Entities.PropertyKey(34359738368L)))!= managerId)
{
  /* There is an explicit Manager */
  return managerId;
}
if (resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673108L))== null)
{
  /* No org => we can't get any manager */
  return managerId;
}

managerId = ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673108L)), new Usercube.Data.Api.Entities.PropertyKey(8589934726L))== null) ? null : resourceAdapter.GetProperty<long?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673108L)), new Usercube.Data.Api.Entities.PropertyKey(8589934726L)), new Usercube.Data.Api.Entities.PropertyKey(34359738368L)));
if (managerId == null)
{
  /* No org manager => we can't get any manager */
  return managerId;
}

if (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673122L))== null) ? null : resourceAdapter.GetProperty<long?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673122L)), new Usercube.Data.Api.Entities.PropertyKey(34359738368L)))!= managerId)
{
  /* The current user is not his org's manager => we take the org's manager */
  return managerId;
}
/* We take the N+2 org's manager */
managerId = ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673108L)), new Usercube.Data.Api.Entities.PropertyKey(8589934727L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673108L)), new Usercube.Data.Api.Entities.PropertyKey(8589934727L)), new Usercube.Data.Api.Entities.PropertyKey(8589934726L))== null) ? null : resourceAdapter.GetProperty<long?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673108L)), new Usercube.Data.Api.Entities.PropertyKey(8589934727L)), new Usercube.Data.Api.Entities.PropertyKey(8589934726L)), new Usercube.Data.Api.Entities.PropertyKey(34359738368L))));
return managerId;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673099L), new Usercube.Data.Api.Entities.PropertyKey(-9223371942365495296L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673105L), new Usercube.Data.Api.Entities.PropertyKey(-9223371942365495296L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673122L), new Usercube.Data.Api.Entities.PropertyKey(-9223371942365495296L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673108L), new Usercube.Data.Api.Entities.PropertyKey(8589934726L), new Usercube.Data.Api.Entities.PropertyKey(-9223371942365495296L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673108L), new Usercube.Data.Api.Entities.PropertyKey(8589934727L), new Usercube.Data.Api.Entities.PropertyKey(8589934726L), new Usercube.Data.Api.Entities.PropertyKey(-9223371942365495296L)) };
}
public static class Expression2A2AFCAC3BF60AF1582FF4886E244E774FE1A1AD721B214F1CDF6804EF185921
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
var ret = "";

if (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673123L))!= null)
{
  ret += resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673123L))+ " - ";
}

ret += resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))+ ' ' + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L));

return ret;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673123L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class ExpressionBAEF70E4876EBC6279CFC68CBAAE619C89F6E56485A1949535DAB9456D1BE2B0
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
if(!resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673114L)).HasValue && !resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)).HasValue)
{
  return true;
}

if(resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673114L)).HasValue)
{
  return resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673114L))> DateTime.UtcNow;
}

return resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L))> DateTime.UtcNow;;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673114L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673090L)) };
}
public static class ExpressionF1DC933292A1C384BEF601457DE4E744D833012C4C22C4E0D97C9AC1EE656E92
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))+ ' ' + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))).Approximate();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression28BC8360F0A6738EE06D3F25ACFC650435BC09DFCBE61487F975C13D41241E10
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Approximate();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class ExpressionE9ABD6C394431FB0330AE6D1C3AA118B40C52BE922927A8547F421DD9EB3DEB6
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))+ ' ' + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))).Approximate();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class Expression14279A1976F2EC717F4BD2318FE5C11D6DD9FD23BE1A91FD6C6ED7297653F4B9
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Approximate();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class ExpressionB93F502C97D44A57B4D690BA4BC6E2B9A4B11D6264F43622D73726A4FDB6E282
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673094L)));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673094L)) };
}
public static class ExpressionF7246E035678AB113E82C8A4AFC94F4D22218ACF209EC7F992215E957EC5EE33
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
var ret = "";

if (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738503L))!= null)
{
    ret += resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738503L));
}

if (resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))!= null)
{
    if (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738503L))!= null)
    {
        ret += " - ";
    }

    ret += resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))+ ' ' + resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L));
}

return ret;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738503L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class Expression03659AA73309399FB821386CBF94F97ED5982DA8DAFDEA3539BB5EAD43831E26
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null ? null : (resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))+ ' ' + resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class Expression58DE52475C74B96413AD7DAD787A22358D79EAE9A8DC1BE67A0A2F9BD4252E4F
{
public static long? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
/* trivial cases first */
if ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) || (resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).Count == 0))
{
    return default(long?);
}

if (resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).Count == 1)
{
    return resourceAdapter.GetProperty<long?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949672960L));
}

var now = DateTime.UtcNow;
var records = new System.Collections.Generic.List<(long? id, bool main, System.DateTime start, System.DateTime end)>();
foreach (var record in resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)))
{
    var id = resourceAdapter.GetProperty<long?>(record, new Usercube.Data.Api.Entities.PropertyKey(42949672960L));
    records.Add((id, false, resourceAdapter.GetProperty<System.DateTime?>(record, new Usercube.Data.Api.Entities.PropertyKey(42949673119L))?? System.DateTime.MinValue, resourceAdapter.GetProperty<System.DateTime?>(record, new Usercube.Data.Api.Entities.PropertyKey(42949673097L))?? System.DateTime.MaxValue));
    records.Add((id, false, resourceAdapter.GetProperty<System.DateTime?>(record, new Usercube.Data.Api.Entities.PropertyKey(42949673092L))?? System.DateTime.MinValue, resourceAdapter.GetProperty<System.DateTime?>(record, new Usercube.Data.Api.Entities.PropertyKey(42949673090L))?? System.DateTime.MaxValue));
    records.Add((id, false, resourceAdapter.GetProperty<System.DateTime?>(record, new Usercube.Data.Api.Entities.PropertyKey(42949673116L))?? System.DateTime.MinValue, resourceAdapter.GetProperty<System.DateTime?>(record, new Usercube.Data.Api.Entities.PropertyKey(42949673114L))?? System.DateTime.MaxValue));
}

/* all the records are in the future, take the closest one */
if (records.All(r => r.start > now))
{
    return records.OrderBy(r => (r.start, r.main, r.id)).First().id;
}

/* all the records are in the past, take the closest one */
if (records.All(r => r.end < now))
{
    return records.OrderByDescending(r => (r.end, r.main, r.id.HasValue ? -r.id.Value : long.MinValue)).First().id;
}

/* find the closest current record */
var currentRecord = records.Where(r => (r.start < now) && (r.end > now)).OrderByDescending(r => (r.start, r.main, r.id.HasValue ? -r.id.Value : long.MinValue)).Select(r => r.id).FirstOrDefault();
if (currentRecord == null)
{
    /* current record not found : take the first */
    currentRecord = records.OrderBy(r => (r.main, r.id)).First().id;
}

return currentRecord;
}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(-9223371942365495296L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673119L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673097L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673092L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673116L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673114L)) };
}
public static class Expression83B03AF77FF14458BA406BEBA65C6F3DC89B17C211B97E15B03E59BDD83BE78F
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673110L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673110L)) };
}
public static class Expression432AFA77A3A6A744A67707796C81A01B0682D84E54D34C734BE4D6D5F9881FFD
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673112L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673112L)) };
}
public static class Expression46B48C729F5182E04868164FD84071E2273B2710D8F0F72EF000CA6CDEA9876A
{
public static long? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
if (resourceAdapter.GetProperty<bool?>(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738504L)).GetValueOrDefault())
{
    return -103L;
}

if ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) || (resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).Count == 0))
{
    return -100L;
}

/* at least of current record */
if (resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).Any(r => (!resourceAdapter.GetProperty<System.DateTime?>(r, new Usercube.Data.Api.Entities.PropertyKey(42949673092L)).HasValue || (resourceAdapter.GetProperty<System.DateTime?>(r, new Usercube.Data.Api.Entities.PropertyKey(42949673092L))< DateTime.UtcNow)) && (!resourceAdapter.GetProperty<System.DateTime?>(r, new Usercube.Data.Api.Entities.PropertyKey(42949673090L)).HasValue || (resourceAdapter.GetProperty<System.DateTime?>(r, new Usercube.Data.Api.Entities.PropertyKey(42949673090L))> DateTime.UtcNow))))
{
    return -101L;
}

/* at least of record in the future */
if (resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).Any(r => resourceAdapter.GetProperty<System.DateTime?>(r, new Usercube.Data.Api.Entities.PropertyKey(42949673092L)).HasValue && (resourceAdapter.GetProperty<System.DateTime?>(r, new Usercube.Data.Api.Entities.PropertyKey(42949673092L))> DateTime.UtcNow)))
{
    return -102L;
}

return -100L;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738504L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673092L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)) };
}
public static class Expression130B6D14BE633C56DBCDD09914A0245BE4D9C0B2B3E264B350B22FD87ADAA56F
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(60129542337L))?? Usercube.Expressions.Functions.UtilExpressions.ToFormatedDN(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(60129542287L)));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(60129542337L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(60129542287L)) };
}
public static class Expression90B77BB4FB875A9505D0337755DD0FDF1C9E0B789C01ECF6F5E711ABA50D5B7A
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
      if (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(60129542336L))== null) {
        return false;
      }
      if ((int.Parse(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(60129542336L))) & 2) != 0) {
        return false;
      }
      if (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(60129542273L))!= null && resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(60129542273L))!= "0" && resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(60129542273L))!= "9223372036854775807" && Usercube.Expressions.Functions.UtilExpressions.ParseSince1601Date(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(60129542273L))) < DateTime.UtcNow) {
        return false;
      }

    return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(60129542304L))== null) || (Usercube.Expressions.Functions.UtilExpressions.ParseSince1601Date(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(60129542304L))) < DateTime.UtcNow.AddMonths(-6)));
  }
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(60129542336L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(60129542273L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(60129542304L)) };
}
public static class Expression622C1867C263DCDB127495920D631F8F6ADA25C3B9E20083FEE80E2D5F125293
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntity(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(85899346049L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(85899346049L)), new Usercube.Data.Api.Entities.PropertyKey(98784247939L)))+ " - " + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(85899346051L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(85899346049L), new Usercube.Data.Api.Entities.PropertyKey(98784247939L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(85899346051L)) };
}
public static class Expression034697BBCDDBE0B3C06A2DD90076E45FEFC37872DC33964E7374D139595DAC43
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(120259084432L)).HasValue && resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(120259084423L)).HasValue;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(120259084432L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(120259084423L)) };
}
public static class ExpressionFFBDC46926BC4B434875F84AFC1319966F3B94C6C7B6D6853E2CF0AA924E142C
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(141733920897L))?? resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(141733920900L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(141733920897L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(141733920900L)) };
}
public static class Expression79723AA04E8311435C82E6B089EC66A54DD6165618F1CDCE97A960C2392C84F5
{
public static long? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
if (!string.IsNullOrEmpty(((resourceAdapter.GetEntity(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888193L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888193L)), new Usercube.Data.Api.Entities.PropertyKey(103079215235L))))) {
    return resourceAdapter.GetProperty<long?>(resourceAdapter.GetEntity(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888193L)), new Usercube.Data.Api.Entities.PropertyKey(103079215104L));
}

var squery = "select Id where ((EmployeeId=\"" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888199L))+ "\") or (FirstName=\"" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888201L))+ "\" and LastName=\"" + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888204L))+ "\"))";
var resources = queryHandler.Select<object>(squery,"Directory_UserRecord");    
if (resources == null || resources.Count == 0) {
    return -6001L;
}
else if (!string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888203L)))) {
    return -6002L;
}

return -6003L;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888193L), new Usercube.Data.Api.Entities.PropertyKey(103079215235L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888193L), new Usercube.Data.Api.Entities.PropertyKey(-9223371942365495296L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888199L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888201L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888204L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888203L)) };
}
public static class Expression885BF037ACCE7B15FA928A51686F3996E8010C02025F662D4BB563E9C4B292AA
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("item"), new Usercube.Data.Api.Entities.PropertyKey(90198608183427L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(90198608183427L)) };
}
public static class ExpressionB3437EC3053CEAC85B5710B8233D8D5E322C33FE007FD695D876509968A31A6D
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("item"), new Usercube.Data.Api.Entities.PropertyKey(90202903150743L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(90202903150743L)) };
}
public static class Expression1734545591DEFAE243D307F7834DC1CFAA0802283AA3156DC76AB37F87056A8D
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
if (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673122L))== null) ? null : ((resourceAdapter.GetEntities(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673122L)), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : resourceAdapter.GetEntities(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673122L)), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).Any(r => resourceAdapter.GetProperty<string?>(r, new Usercube.Data.Api.Entities.PropertyKey(42949673094L))!= null)))== true)
{
  return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673094L));
}

var firstName = ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant());
var lastName = ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant());
if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName))
{
  return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673094L));
}

return firstName + "." + lastName + (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L)), new Usercube.Data.Api.Entities.PropertyKey(47244640386L))))== "EXTERNE OU PARTENAIRE" ? "-ext" : string.Empty) + "@ca-assurances.fr";}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673122L), new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673094L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673094L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673131L), new Usercube.Data.Api.Entities.PropertyKey(115964117124L), new Usercube.Data.Api.Entities.PropertyKey(47244640386L)) };
}
public static class ExpressionD2A13397EDD68D116FF03FF2D14D68C210A5AA428C6C007B1D3B4D8971D4559D
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return Usercube.Expressions.Functions.UtilExpressions.ToFormatedDN(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150328150327441L)));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(150328150327441L)) };
}
public static class ExpressionE75FD9AD6970A132B978A406BEEB9700AE76BF860936C3847D1DA2A9541E1CAF
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return Usercube.Expressions.Functions.UtilExpressions.ToFormatedDN(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(158918084919428L)));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(158918084919428L)) };
}
public static class Expression8E7474450FF392D5AE151C4729A6F2CC80D7E10EB84FDCE9F5ABFD758CF397B6
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant()))))+ "." + ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant()))));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673105L), new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673105L), new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class ExpressionBE18AAA4EA02119D3710D42C3F6D89CDEDC28BAAB7AF1C4F49B1C15878F10911
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{if (!string.IsNullOrEmpty(((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673118L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673118L)), new Usercube.Data.Api.Entities.PropertyKey(25769803928L))))) { return (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673118L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673118L)), new Usercube.Data.Api.Entities.PropertyKey(25769803928L)))+ ",OU=Utilisateurs,DC=ca-pacificadev,DC=fr"); } return "OU=Pacifica,OU=Utilisateurs,DC=ca-pacificadev,DC=fr";}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673118L), new Usercube.Data.Api.Entities.PropertyKey(25769803928L)) };
}
public static class Expression215A95E89369EF8DD27D9E11A4CADA18EC8BEBF194851EA23B5FFE3527579443
{
public static string Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888201L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888201L)).ToUpper())+ ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888204L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888204L)).ToUpper());}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888201L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888204L)) };
}
public static class Expression2B583DAB7D296819F780D83B165C97AF9E060BAD27A152D0A9920CA4046BBE8F
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
if (string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855503L)))) {
  return null;
}

var establishments = resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150323855503L)).Split('/');
return ((establishments == null) ? null : ((establishments.LastOrDefault() == null) ? null : establishments.LastOrDefault().Trim()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(150323855503L)) };
}
public static class ExpressionC4C09CB0CEBC2B5ED667C86955CD673DF94062C082AA67AF6191C05197BAB8C3
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{if (((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(176093659265L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(176093659265L)).StartsWith("CAS"))== true) { return "CAAS"; } else if (((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(176093659265L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(176093659265L)).StartsWith("PCKV"))== true) { return "Viaren"; } else if (((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(176093659265L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(176093659265L)).StartsWith("PCKS"))== true) { return "Sirca"; } else { return "Pacifica"; };}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(176093659265L)) };
}
public static class Expression9AE1491373AFF0E1FAD0F722F57068BC9AA0D2306C99F5DD580FF0CBDDC5B19F
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
			if (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495751L))== "Alternants") {
				return "Apprenti";
			}
			else if (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495751L))== "Stagiaires") {
				return "Stagiaire";
			}
			else if (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495751L))== "Expatriés" || resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495751L))== "Mandataire Social") {
				return "CDI";
			}
			return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495751L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495751L)) };
}
public static class Expression4A74B1191E5D942534C107C36467FC3C7BB032F566BE7BA10BB296B45C8A9008
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
            var organizationLevel = string.Empty;
            var companyIdentifier = resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495748L))== "CREDIT AGRICOLE ASSURANCES SOLUTIONS" ? "CAS" : "PCK";
            if (!string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495768L)))) {
                organizationLevel = resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495768L));
            }
            else if (!string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495767L)))) {
                organizationLevel = resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495767L));
            }
            else if (!string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495766L)))) {
                organizationLevel = resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495766L));
            }
            else if (!string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495765L)))) {
                organizationLevel = resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495765L));
            }
            else if (!string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495764L)))) {
                organizationLevel = resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495764L));
            }
            else if (!string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495763L)))) {
                organizationLevel = resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495763L));
            }
            else if (!string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495762L)))) {
                organizationLevel = resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495762L));
            }
            else if (!string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495761L)))) {
                organizationLevel = resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495761L));
            }

			if (organizationLevel.StartsWith(companyIdentifier)) {
				return organizationLevel;
			}
            return companyIdentifier + organizationLevel;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495748L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495768L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495767L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495766L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495765L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495764L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495763L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495762L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495761L)) };
}
public static class ExpressionD91D58DBE4FFAD2075B2BF3E340B909E586254195EFF7B407BA5F5D277784B15
{
public static string Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
			return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(206158430347L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(206158430347L)).Split('/') == null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(206158430347L)).Split('/').LastOrDefault() == null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(206158430347L)).Split('/').LastOrDefault().Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(206158430347L)).Split('/').LastOrDefault().Simplify().ToUpperInvariant()))));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(206158430347L)) };
}
public static class Expression8604FF7218AE61EDEE7397583788165F863B2775B7999EF272C760B789F3770F
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "OU=users,DC=OUD,DC=HAB,DC=CAAS";}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() {  };
}
public static class ExpressionFC559F0770A5E2351FFD91D6CC1259796D3EA7432C057A009C7527BB3D0C2C5B
{
public static string Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant()))))+ " " + ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673105L)), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant()))));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673105L), new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673105L), new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression1E1BF519FFCE3628041A5ABBAC46965AA5792F413E677C8708CECBDB8ADBD2AB
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "ou=Nominatifs,ou=caas,ou=People,o=unixauthcaashp";}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() {  };
}
public static class Expression1724F49360329156AA57D85650BD56814B6097545C025BBF3C5AFA3B0FA4EA1F
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150328150327443L)).Simplify().ToLowerInvariant() + " " + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150328150327459L)).Simplify().ToLowerInvariant();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(150328150327443L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(150328150327459L)) };
}
public static class ExpressionE41B4C22906AE8F58D09B1B9BB90BCDC209AA79000CF91D4D2A9B2BD795C2E55
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(158918084919433L)).Simplify().ToLowerInvariant() + " " + resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(158918084919453L)).Simplify().ToLowerInvariant();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(158918084919433L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(158918084919453L)) };
}
public static class Expression391CBB3FFEA1C380D87916665365697E273912734841759016F1484B93DE9142
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return (((((resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)))+ " " + ((resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)))) == null) ? null : (((resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)))+ " " + ((resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)))).Simplify());}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class ExpressionD2B2020E666700E75314058C8EDF4705E3F7DD3D196C0A09B8E563967B313D36
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) || (resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).Count == 0)) ? null : (((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).ToUpper())+ ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).ToUpper()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class ExpressionCB4E0174423058100C2D58C1FF692FF2B6CACB5DC28EE9C8DF18A52D60F1DE58
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).ToUpper()))+ " " + ((resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).ToUpper()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class Expression0B6526639E427C943B845DF48E020D2CF3F3927BDA8FFFFEAA38DA4244DCF8DC
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(8589934723L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(8589934723L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(8589934723L)).Simplify().ToUpperInvariant()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(8589934723L)) };
}
public static class Expression0E676E2736A83859A0219CF00C341FBD5AE990A54639E715A05A10CC324163F7
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150328150327441L))!= null && (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150328150327441L)).Contains("OU=Users,") || resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150328150327441L)).Contains(" Users")) && resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150328150327441L)).StartsWith("cn=U");}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(150328150327441L)) };
}
public static class Expression4CE3BF4051ED5A0502D5A51AD5C0081D128030DCAE279F122E566900F74FDD8D
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{if (((resourceAdapter.GetEntity(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888193L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888193L)), new Usercube.Data.Api.Entities.PropertyKey(103079215235L)))== "KO") { return null; } return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888199L))?? resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(146028888203L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888193L), new Usercube.Data.Api.Entities.PropertyKey(103079215235L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888199L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(146028888203L)) };
}
public static class ExpressionDC3548CFD64B44278D3B00EAE98CF43D62D4A1BBE448E58E4C2C9F68090D3E7A
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(141733920898L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(141733920898L)).ToUpper())+ ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(141733920899L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(141733920899L)).ToUpper());}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(141733920898L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(141733920899L)) };
}
public static class Expression6FCCFA76C039DAF7C47D3D4147051C333CF6EC230AC3BD820DE603C9278E25E3
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntities(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(193273528450L))== null) || (resourceAdapter.GetEntities(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(193273528450L)).Count == 0)) ? null : (((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(193273528450L))[0], new Usercube.Data.Api.Entities.PropertyKey(197568495754L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(193273528450L))[0], new Usercube.Data.Api.Entities.PropertyKey(197568495754L)).ToUpper())+ ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(193273528450L))[0], new Usercube.Data.Api.Entities.PropertyKey(197568495756L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(193273528450L))[0], new Usercube.Data.Api.Entities.PropertyKey(197568495756L)).ToUpper())+ ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(193273528450L))[0], new Usercube.Data.Api.Entities.PropertyKey(197568495748L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(193273528450L))[0], new Usercube.Data.Api.Entities.PropertyKey(197568495748L)).ToUpper()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(193273528450L), new Usercube.Data.Api.Entities.PropertyKey(197568495754L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(193273528450L), new Usercube.Data.Api.Entities.PropertyKey(197568495756L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(193273528450L), new Usercube.Data.Api.Entities.PropertyKey(197568495748L)) };
}
public static class Expression3BE815CAE50CEA631ABF4B776196C8619C408E9C595AF6DEDBDC09A6BED163EA
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495754L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495754L)).ToUpper())+ ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495756L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495756L)).ToUpper())+ ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495748L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(197568495748L)).ToUpper());}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495754L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495756L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(197568495748L)) };
}
public static class Expression613D513C3A56379A910DF26782DB2A18363748036DC9D3119AAF12D3A04EF135
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673096L))+ (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))+ resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))).Simplify();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673096L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class ExpressionBB0FD96140828526170B292B5F5191DED012946EAA717FD7BB0951DE5717024B
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return (resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))+ resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))).Simplify();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)) };
}
public static class ExpressionEDEAA8A679FACDF74834AB7BF2DA2028A4A4C30E586D0F22FC225167F94BCBED
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150328150327442L))+ resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(150328150327440L)).Simplify();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(150328150327442L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(150328150327440L)) };
}
public static class Expression5EF8DAF88DCD1665C58AAF614D3ADF67AF26700B79E49DF22F6E18E84BA69B90
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant()))+ "." + ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression5A1759B70E6823DAF1BBADE35C55F58F206C74DCE061E6C3130412B4E1178CAA
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).ToUpper())+ ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).ToUpper());}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression5C8374909E7FDDA284B48B2A71E5B6CF2E757B28FA834DEB7B699CEC6077419D
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) || (resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).Count == 0)) ? null : (((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).ToUpper())+ ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).ToUpper())+ ((resourceAdapter.GetEntity(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673130L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673130L)), new Usercube.Data.Api.Entities.PropertyKey(107374182529L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673130L)), new Usercube.Data.Api.Entities.PropertyKey(107374182529L)).ToUpper())));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673130L), new Usercube.Data.Api.Entities.PropertyKey(107374182529L)) };
}
public static class Expression11322ED4ABDF7C9B3B1F9F0272E8B81B2B67FFEA8BE5C8D38177C78CB7493578
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).ToUpper())+ ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).ToUpper())+ ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673130L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673130L)), new Usercube.Data.Api.Entities.PropertyKey(107374182529L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673130L)), new Usercube.Data.Api.Entities.PropertyKey(107374182529L)).ToUpper()));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673130L), new Usercube.Data.Api.Entities.PropertyKey(107374182529L)) };
}
public static class Expression704668D575658CC6666A325CFD8B27328FAD93953D0ED45616DD2990E937740F
{
public static bool Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<bool?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(34359738504L)).GetValueOrDefault();}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738504L)) };
}
public static class Expression34ABCE93423B9FED4FF6AE602EA38FE4E802BB79F3602A664EF23601902F36EE
{
public static DateTime? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673119L))?? resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673116L))?? resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673092L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673119L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673116L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673092L)) };
}
public static class ExpressionD560D3290F1CA6BACB80203A97D2DC4F52C0B387006AA099898C6B921A9E0250
{
public static DateTime? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673097L))?? resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673114L))?? resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673097L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673114L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673090L)) };
}
public static class Expression39D6F51331E3DDEDAFFE5F39EA72B5EC60E73CD4433679CE686EE18EB05942E8
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673091L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673091L)) };
}
public static class ExpressionDCDFCB8D9A4794EC786956998C8BCC3770FF58500DD47FF25A3269AC0B351E52
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673119L)).HasValue ? resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673119L)).Value.ToString("yyyyMMdd") : string.Empty;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673119L)) };
}
public static class Expression41A26B7D104209398AB4D7BC57021644691E2BDCBD9C8CC2AF0DA32B2B35D7F2
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673115L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673115L)) };
}
public static class Expression83A35D241E2A34B3F3899250A628A25F828BACB44A341C004DDF0D1FBDA0319E
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntity(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(124554051714L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(124554051714L)), new Usercube.Data.Api.Entities.PropertyKey(98784247939L)));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(124554051714L), new Usercube.Data.Api.Entities.PropertyKey(98784247939L)) };
}
public static class Expression86254F1985BC71939FB6EE73BFA8FDDCB38391834FEB97FDE89B7D743F25C0C7
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntity(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(124554051714L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("resource"), new Usercube.Data.Api.Entities.PropertyKey(124554051714L)), new Usercube.Data.Api.Entities.PropertyKey(98784247941L)));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(124554051714L), new Usercube.Data.Api.Entities.PropertyKey(98784247941L)) };
}
public static class Expression679301E64230D581919484C6318F8EB758D2DE084D9FF784CB8D3E744878177A
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Applications";}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() {  };
}
public static class Expression7773C1192E6A54D17223FE23791D609C64590453B0668EF20E5758A75547FC8C
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntity(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(34359738512L))== null) ? null : resourceAdapter.GetProperty<long?>(resourceAdapter.GetEntity(resolver.GetValue<object>("person"), new Usercube.Data.Api.Entities.PropertyKey(34359738512L)), new Usercube.Data.Api.Entities.PropertyKey(17179869184L)))== -101L;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738512L), new Usercube.Data.Api.Entities.PropertyKey(-9223371942365495296L)) };
}
public static class Expression2D2136C5523262CBAA5DA0EDE262AD6095B3211434726FBF5E9F930A9D61DECE
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{var ebDate = ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null) ? null : resourceAdapter.GetProperty<System.DateTime?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L)), new Usercube.Data.Api.Entities.PropertyKey(120259084423L))); return ebDate.HasValue && resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)).HasValue ? (resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)).Value < ebDate.Value  || (resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)).Value.Day == ebDate.Value.Day && resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)).Value.Month == ebDate.Value.Month && resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)).Value.Year == ebDate.Value.Year)) : true;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673132L), new Usercube.Data.Api.Entities.PropertyKey(120259084423L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673090L)) };
}
public static class Expression5518CDF05FA19AA7884323FF819AFCA438BDD7510D0DB2BC08E3E5A195516F03
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{if (string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673138L)))) { return true; } var newValue = ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant()))+ "." + ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant()))+ (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L)), new Usercube.Data.Api.Entities.PropertyKey(47244640386L))))== "EXTERNE OU PARTENAIRE" ? "-ext" : string.Empty) + (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673130L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673130L)), new Usercube.Data.Api.Entities.PropertyKey(107374182531L)))== "Viaren" ? "@viaren.fr" : "@ca-pacifica.fr"); return newValue != resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673094L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673138L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673131L), new Usercube.Data.Api.Entities.PropertyKey(115964117124L), new Usercube.Data.Api.Entities.PropertyKey(47244640386L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673130L), new Usercube.Data.Api.Entities.PropertyKey(107374182531L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673094L)) };
}
public static class Expression9F8916256A5F0F7FF9F32D110720D99A8CE09F20DA31D6B12CD0522B8C824539
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{if (string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))) || string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)))) { return null; } return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant()))+ "." + ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant()))+ (resolver.GetValue<int>("iteration")== 0 ? "" : resolver.GetValue<int>("iteration").ToString()) + (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L)), new Usercube.Data.Api.Entities.PropertyKey(47244640386L))))== "EXTERNE OU PARTENAIRE" ? "-ext" : string.Empty) + (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673130L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673130L)), new Usercube.Data.Api.Entities.PropertyKey(107374182531L)))== "Viaren" ? "@viaren.fr" : "@ca-pacifica.fr");}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673131L), new Usercube.Data.Api.Entities.PropertyKey(115964117124L), new Usercube.Data.Api.Entities.PropertyKey(47244640386L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673130L), new Usercube.Data.Api.Entities.PropertyKey(107374182531L)) };
}
public static class Expression2229A7896B3FA966B4A112162506F3FB151FB7ACA0359249C1626368F5A5D517
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{var ebDate = ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null) ? null : resourceAdapter.GetProperty<System.DateTime?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L)), new Usercube.Data.Api.Entities.PropertyKey(120259084432L))); return ebDate.HasValue && resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673092L)).HasValue ? (resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673092L)).Value > ebDate.Value || (resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673092L)).Value.AddDays(1).Day == ebDate.Value.Day && resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673092L)).Value.Month == ebDate.Value.Month && resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673092L)).Value.Year == ebDate.Value.Year)) : true;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673132L), new Usercube.Data.Api.Entities.PropertyKey(120259084432L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673092L)) };
}
public static class Expression19A2AE56E7CDA2773F2CE8B3D995A958551933F6583287479031BD2AF904BC34
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{ return ( ((Nullable<DateTime>) resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673092L))).HasValue && ((Nullable<DateTime>) resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L))).HasValue) ?  resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673092L))< resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)): true;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673092L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673090L)) };
}
public static class Expression4B8ABE24FFF29F3B9F47DF8911D3EDB63D7D2288DDA69A1D06B54C2F3669E8FE
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null ? resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673092L)).HasValue : true;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673092L)) };
}
public static class Expression42D3B37C148343AE730E3F2D0177C9EBF3DB13B117BA24AC57AF066F7AEBF0D0
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673117L))) || resourceAdapter.GetProperty<long?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949672960L))< 0L;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673117L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(-9223371942365495296L)) };
}
public static class Expression23EDD0FA1BDB70BA7985072B7BB11819D1B86A23C8D6260D3F5D9778BA1D7965
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673123L))+ '_' + Guid.NewGuid().ToString("N");}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673123L)) };
}
public static class Expression9552D4BD0A52DCF0F180F31ACCB2C2E13FEE65B3366E41A7BD5F2D1A67C6EE8F
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{if (string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673094L)))) { return true; } var newValue = ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant()))+ "." + ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant()))+ (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L)), new Usercube.Data.Api.Entities.PropertyKey(47244640386L))))== "EXTERNE OU PARTENAIRE" ? "-ext" : string.Empty) + "@ca-assurances.fr"; return newValue != resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673094L));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673094L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673131L), new Usercube.Data.Api.Entities.PropertyKey(115964117124L), new Usercube.Data.Api.Entities.PropertyKey(47244640386L)) };
}
public static class Expression2DBCD55563297A791A4989A990BBA3768C2DB7F5A6A31967FA34AA789C13095C
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{if (string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))) || string.IsNullOrEmpty(resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)))) { return null; } return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant()))+ "." + ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant()))+ (resolver.GetValue<int>("iteration")== 0 ? "" : resolver.GetValue<int>("iteration").ToString()) + (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L)), new Usercube.Data.Api.Entities.PropertyKey(47244640386L))))== "EXTERNE OU PARTENAIRE" ? "-ext" : string.Empty) + "@ca-assurances.fr";}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673131L), new Usercube.Data.Api.Entities.PropertyKey(115964117124L), new Usercube.Data.Api.Entities.PropertyKey(47244640386L)) };
}
public static class ExpressionDE6B62B410E0DDA3E684587DAEDF332D4525687F50946631A54450D1A2BA3FF3
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{var result = resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673123L));
if (string.IsNullOrEmpty(result))
{
    return null;
}


return result;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673123L)) };
}
public static class Expression7C7E0FA1EB5008CE242DC6457B5F30E7367919D97DFB36DB30CFE5E99D1914F1
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null ? true : ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null) ? null : resourceAdapter.GetProperty<bool?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L)), new Usercube.Data.Api.Entities.PropertyKey(120259084436L)));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673132L), new Usercube.Data.Api.Entities.PropertyKey(120259084436L)) };
}
public static class Expression772A652F6F9788582CCD11993A60C82109B998E66094675FA95F98757EC1F12E
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{ return ( ((Nullable<DateTime>) resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673116L))).HasValue && ((Nullable<DateTime>) resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673114L))).HasValue) ?  resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673116L))< resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673114L)): true;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673116L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673114L)) };
}
public static class Expression5C2D46EB18E5361A9F53FD9C3C76B819B3FBEA9FEAE6438563D5C531687DDDD5
{
public static System.DateTime? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L)), new Usercube.Data.Api.Entities.PropertyKey(120259084425L)))!= null) && (!resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)).HasValue) ? ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null) ? null : resourceAdapter.GetProperty<System.DateTime?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L)), new Usercube.Data.Api.Entities.PropertyKey(120259084423L))): null;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673132L), new Usercube.Data.Api.Entities.PropertyKey(120259084425L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673090L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673132L), new Usercube.Data.Api.Entities.PropertyKey(120259084423L)) };
}
public static class ExpressionDDB9BCFD060520A7778A25E69958D7E27F1EF8258AC9B093D1BC02E60DC7A95E
{
public static System.DateTime? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L)), new Usercube.Data.Api.Entities.PropertyKey(120259084425L)))!= null) && (!resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673092L)).HasValue) ? ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null) ? null : resourceAdapter.GetProperty<System.DateTime?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L)), new Usercube.Data.Api.Entities.PropertyKey(120259084432L))): null;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673132L), new Usercube.Data.Api.Entities.PropertyKey(120259084425L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673092L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673132L), new Usercube.Data.Api.Entities.PropertyKey(120259084432L)) };
}
public static class Expression1ADFC0798E6A356C0C158FF902339301EC727788C77F636BB97428C45FA84D28
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetEntities(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))!= null && resourceAdapter.GetEntities(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).Count > 0 ? resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673123L)): null;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673123L)) };
}
public static class Expression945C8DBBA698E45476DE7A07F6CF558CBA3F3B15A9843CA1877EB3FBEADA0770
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L)), new Usercube.Data.Api.Entities.PropertyKey(120259084425L)))!= null) && (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117121L)))== "Externe international" || ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117121L)))== "Partenaire Pack-Solutions" || ((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117121L)))== "Partenaire TMA") ? false : true;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673132L), new Usercube.Data.Api.Entities.PropertyKey(120259084425L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673131L), new Usercube.Data.Api.Entities.PropertyKey(115964117121L)) };
}
public static class ExpressionD29CEE2A2C59255115C525BF089FBCA71076248DE0D8153D458A896E0C2FEBDB
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return (((resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673130L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673130L)), new Usercube.Data.Api.Entities.PropertyKey(107374182534L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673130L)), new Usercube.Data.Api.Entities.PropertyKey(107374182534L)), new Usercube.Data.Api.Entities.PropertyKey(111669149826L))))== "ALIMENTATION AUTOMATIQUE") && (resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null) ? false : true;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673130L), new Usercube.Data.Api.Entities.PropertyKey(107374182534L), new Usercube.Data.Api.Entities.PropertyKey(111669149826L)) };
}
public static class ExpressionD50C2865AEF29E8E957BDDE7BA9CF07E901996099F7DC2F811BCB0C6D819AFE1
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)).Simplify().ToLowerInvariant())+ '.' + ((resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify() == null) ? null : resourceAdapter.GetProperty<string?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).Simplify().ToLowerInvariant())+ (resolver.GetValue<int>("iteration")== 0 ? "" : resolver.GetValue<int>("iteration").ToString());}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression4E4205038CDB83B37B84EA19E49956935BC775E3D5F6EB39FF99210C788E2F0E
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetEntity(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673132L))== null ? resourceAdapter.GetProperty<System.DateTime?>(resolver.GetValue<object>("record"), new Usercube.Data.Api.Entities.PropertyKey(42949673090L)).HasValue : true;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(42949673090L)) };
}
public static class ExpressionA188E87CED96DE50E986FE9B93D295004E3CD487FD2E18933FDA119538758E66
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
		const string listAlphaNum = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		const string listNum = "0123456789";
		System.Random r = new System.Random();
		return "U" + listAlphaNum[r.Next(35)] + listAlphaNum[r.Next(35)] + listAlphaNum[r.Next(35)] + listAlphaNum[r.Next(35)] + listNum[r.Next(9)];}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() {  };
}
public static class ExpressionDFFAEB4BE26B5779A89949DCF4327944BB8F62B07F4A77FE1C3628E9F3C60B1A
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Nouveau collaborateur externe - " + ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673096L))))+ " - " +  Usercube.Expressions.Functions.UtilExpressions.ToFirstName(((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)))), System.Globalization.CultureInfo.InvariantCulture) + " "+ ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).ToUpper())));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673096L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class ExpressionDBEE7E0672D7C830F5CCDC3CCCB612EA03612BE38A78C52B2CDFFDE4FB118605
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return false;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() {  };
}
public static class ExpressionA4D53482C04D53B08F9DBA7F978DBE6F4DC5BB5896834391D14E4938F3D51873
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return true;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() {  };
}
public static class Expression36BBDB60153441BA5AB36F7A76F84A49E1F6C0FB1C2B25815EC271C10D08E9F5
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Nouveau collaborateur interne - " + ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673096L))))+ " - " +  Usercube.Expressions.Functions.UtilExpressions.ToFirstName(((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)))), System.Globalization.CultureInfo.InvariantCulture) + " "+ ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).ToUpper())));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673096L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression00EA92198AA84DD2D51F9F34857206279F458105696A2E1250F30CE646C0FEFD
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))!= null && resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).Count > 0 ? resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))[0], new Usercube.Data.Api.Entities.PropertyKey(42949673123L)): null;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673123L)) };
}
public static class Expression99657252DA702393A6309942E81444E0D3B77129F759A977E0E89812AB79F10B
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Départ RH - " + ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673096L))))+ " - " +  Usercube.Expressions.Functions.UtilExpressions.ToFirstName(((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)))), System.Globalization.CultureInfo.InvariantCulture) + " "+ ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).ToUpper())));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673096L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression4C0487F2A8ED5FCAA1ED43071CB6E21E65DC8BE20411E440BA4E65F00BE12415
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673132L)))!= null && ((resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673131L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673131L)), new Usercube.Data.Api.Entities.PropertyKey(115964117124L)), new Usercube.Data.Api.Entities.PropertyKey(47244640386L)))))== "EXTERNE OU PARTENAIRE";}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673131L), new Usercube.Data.Api.Entities.PropertyKey(115964117124L), new Usercube.Data.Api.Entities.PropertyKey(47244640386L)) };
}
public static class Expression30F5294A3C16D09CBA5BAB6B1B342D658B2F639A7766A7A02CDBCFBB24040335
{
public static bool? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return ((resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L))== null) ? null : ((resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673130L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntity(resourceAdapter.GetEntity(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738506L)), new Usercube.Data.Api.Entities.PropertyKey(42949673130L)), new Usercube.Data.Api.Entities.PropertyKey(107374182531L))))== "Sirca";}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738506L), new Usercube.Data.Api.Entities.PropertyKey(42949673130L), new Usercube.Data.Api.Entities.PropertyKey(107374182531L)) };
}
public static class ExpressionC2278CBD25F75AB9C469F22B6D9D6027452277C3C2256C66BAA121AB69983FAC
{
public static string? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{return "Mise à jour RH - " + ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673096L))))+ " - " +  Usercube.Expressions.Functions.UtilExpressions.ToFirstName(((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)))), System.Globalization.CultureInfo.InvariantCulture) + " "+ ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L))== null) ? null : ((resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault() == null) ? null : ((resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673102L))== null) ? null : resourceAdapter.GetProperty<string?>(resourceAdapter.GetEntities(resolver.GetValue<object>("user"), new Usercube.Data.Api.Entities.PropertyKey(34359738513L)).FirstOrDefault(), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)).ToUpper())));}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() { new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673096L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673098L)), new Usercube.Data.Api.Entities.Binding(new Usercube.Data.Api.Entities.PropertyKey(34359738513L), new Usercube.Data.Api.Entities.PropertyKey(42949673102L)) };
}
public static class Expression5AE7E69A0D1EC402E960F35D9FA20BBCB33D4B154FE4EAE154CB8A25413F75DE
{
public static System.Collections.Generic.Dictionary<string, string>? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
if ((resolver.GetValue<Usercube.ProvisioningPolicy.Entities.IProvisioningOrder>("provisioningOrder")== null) || (resolver.GetValue<Usercube.ProvisioningPolicy.Entities.IProvisioningOrder>("provisioningOrder").ChangeType.IsNone()))
{
  return null;
}

var arguments = new System.Collections.Generic.Dictionary<string, string>();
var workflowIdentifier = "Directory_User_UpdateFromHR";

if ((resolver.GetValue<Usercube.ProvisioningPolicy.Entities.IProvisioningOrder>("provisioningOrder").ChangeType.IsAdded()) || (resolver.GetValue<Usercube.ProvisioningPolicy.Entities.IProvisioningOrder>("provisioningOrder").HasChanged("EmployeeId"))) {
  workflowIdentifier = "Directory_User_CreateFromHR";
}

arguments.Add("WorkflowIdentifier", workflowIdentifier);
return arguments;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() {  };
}
public static class ExpressionC474744124FABB75F9EEBE1FFF660A72E73223988F60925B979D00B5DF8E9A73
{
public static System.Collections.Generic.Dictionary<string, string>? Run(Usercube.IVariableResolver resolver, Usercube.Expressions.Evaluator.IResourceAdapter resourceAdapter, Usercube.Expressions.Evaluator.IQueryHandler queryHandler, ILogger logger)
#line 1
{
if ((resolver.GetValue<Usercube.ProvisioningPolicy.Entities.IProvisioningOrder>("provisioningOrder")== null) || (resolver.GetValue<Usercube.ProvisioningPolicy.Entities.IProvisioningOrder>("provisioningOrder").ChangeType.IsNone()))
{
  return null;
}

var arguments = new System.Collections.Generic.Dictionary<string, string>();
var workflowIdentifier = "Directory_User_UpdateFromHR";

if (resolver.GetValue<Usercube.ProvisioningPolicy.Entities.IProvisioningOrder>("provisioningOrder").TryGetScalar("ReasonForDeparture", out var reason) && (reason != null)) {
  var reasonForDeparture = reason.ToString();
  if (reasonForDeparture == "Sortie externe" || reasonForDeparture == "Depart a la retraite") {
    workflowIdentifier = "Directory_User_DeleteFromHR";
  }
  else if ((reasonForDeparture == "Mobilite groupe") || (reasonForDeparture == "Mobilite intra entite") || (reasonForDeparture == "Mobilite intra groupe")) {
    workflowIdentifier = "Directory_User_MobilityFromHR";
  }
}

arguments.Add("WorkflowIdentifier", workflowIdentifier);
return arguments;}
public static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> Bindings { get { return bindings; } }
private static System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding> bindings =new System.Collections.Generic.HashSet<Usercube.Data.Api.Entities.Binding>() {  };
}

public static class ChangeTypeExtension
{
    public static bool IsNone(this Usercube.ProvisioningPolicy.Entities.ChangeType changeType)
    {
        return changeType == Usercube.ProvisioningPolicy.Entities.ChangeType.None;
    }

    public static bool IsAdded(this Usercube.ProvisioningPolicy.Entities.ChangeType changeType)
    {
        return changeType == Usercube.ProvisioningPolicy.Entities.ChangeType.Added;
    }

    public static bool IsDeleted(this Usercube.ProvisioningPolicy.Entities.ChangeType changeType)
    {
        return changeType == Usercube.ProvisioningPolicy.Entities.ChangeType.Deleted;
    }

    public static bool IsModified(this Usercube.ProvisioningPolicy.Entities.ChangeType changeType)
    {
        return changeType == Usercube.ProvisioningPolicy.Entities.ChangeType.Modified;
    }
}
